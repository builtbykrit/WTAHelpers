//
//  UIImageView+WTANetworking.h
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

// Extension on UIImageView+AFNetworking that adds a custom AFImageCache that stores images on disk.

@interface WTADiskImageCache : NSCache <AFImageCache>

- (UIImage *)cachedImageForRequest:(NSURLRequest *)request;
- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request;

@end

@interface UIImageView (WTANetworking)

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
                success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure;

/**
 * Sets an image from the specified url, constraining the final
 * image to the specified size.
 *
 * @param url the url to load the image from
 * @param size the size to constrain to
 */
- (void)setImageWithURL:(NSURL *)url constrainedToSize:(CGSize)size;

@end


/**
 * Extension to the AFImageResponseSerializer that will constrain the original
 * image to a specified size.
 */
@interface WTAConstrainImageResponseSerializer : AFImageResponseSerializer

    /// Constrained size of the final image
    @property (nonatomic, assign) CGSize constrainedSize;

@end

@implementation WTAConstrainImageResponseSerializer

/// Response object serializer
- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    UIImage *image = [super responseObjectForResponse:response data:data error:error];
    
    if (image && (self.constrainedSize.width > 0) && (self.constrainedSize.height > 0))
    {
        CGFloat aspect = image.size.width / image.size.height;
        CGFloat constrainedAspect = (self.constrainedSize.width / self.constrainedSize.height);
        
        // If the image is the right size then return it
        if (image.size.width == self.constrainedSize.width &&
            image.size.height == self.constrainedSize.height)
        {
            return image;
        }
        
        // Resize the image otherwise
        CGRect imageRect = CGRectMake(0, 0, self.constrainedSize.width, self.constrainedSize.height);
        if (aspect != constrainedAspect)
        {
            if (self.constrainedSize.width / aspect >= self.constrainedSize.height)
            {
                imageRect = CGRectMake(0.0f,
                                       (self.constrainedSize.height - self.constrainedSize.width / aspect) / 2.0f,
                                       self.constrainedSize.width,
                                       self.constrainedSize.width / aspect);
            }
            else
            {
                imageRect = CGRectMake((self.constrainedSize.width - self.constrainedSize.height * aspect) / 2.0f,
                                       0.0f,
                                       self.constrainedSize.height * aspect,
                                       self.constrainedSize.height);
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(self.constrainedSize, NO, [[UIScreen mainScreen] scale]);
        [image drawInRect:imageRect];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return scaledImage;
    }
    
    return image;
}

@end