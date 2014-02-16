//
//  UIImageView+WTANetworking.m
//  Pods
//
//  Created by Novall Khan on 2/12/14.
//
//

#import "UIImageView+WTANetworking.h"

#import "NSString+MD5.h"
#import <sys/xattr.h>

@implementation WTADiskImageCache

// Returns cached image, also looks for version in filesystem
- (UIImage *)cachedImageForRequest:(NSURLRequest *)request
{
    switch ([request cachePolicy]) {
        case NSURLRequestReloadIgnoringCacheData:
        case NSURLRequestReloadIgnoringLocalAndRemoteCacheData:
            return nil;
        default:
            break;
    }
    
    // Load image from cache
    NSString* urlString = [[request URL] absoluteString];
    UIImage *image = [self objectForKey:urlString];
    
    // If we don't have it, try loading it from disk
    if (!image)
    {
        NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [cacheDirectory stringByAppendingPathComponent:[urlString MD5]];
        if ([fileManager fileExistsAtPath:filePath])
        {
            char urlbuffer[1024];
            ssize_t numRead = getxattr([filePath UTF8String], "com.clearleap.sourceURL", urlbuffer, 1024, 0, 0);
            if (numRead != 0 && [[NSString stringWithUTF8String:urlbuffer] isEqualToString:urlString]) {
                image = [[UIImage alloc] initWithContentsOfFile:filePath];
                [self setObject:image forKey:urlString];
            }
        }
    }
    return image;
}

- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request;
{
    NSString* urlString = [[request URL] absoluteString];
    [self setObject:image forKey:urlString];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString* fileName = [urlString MD5];
        NSString *filePath = [cacheDirectory stringByAppendingPathComponent:fileName];
        NSData *data = UIImagePNGRepresentation(image);
        [data writeToFile:filePath atomically:YES];
        const char* urlStringUTF8 = [urlString UTF8String];
        setxattr([filePath UTF8String], "com.clearleap.sourceURL", urlStringUTF8, strlen(urlStringUTF8), 0, 0);
    });
}

@end

@implementation UIImageView (WTANetworking)

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
                success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    [self setImageWithURLRequest:request
                placeholderImage:placeholderImage
                         success:success
                         failure:failure];
    
}

- (void)setImageWithURL:(NSURL *)url constrainedToSize:(CGSize)size
{
    if ((size.width > 0) && (size.height > 0))
    {
        WTAConstrainImageResponseSerializer *serializer = [[WTAConstrainImageResponseSerializer alloc] init];
        serializer.constrainedSize = size;
        [self setImageResponseSerializer:serializer];
        
        NSString *urlString = [url absoluteString];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@#%dx%d", urlString,
                                    (int)size.width, (int)size.height]];
    }
    
    __weak UIImageView* weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:self.image
                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                      weakSelf.image = image;
                      
                      if (request != nil) {
                          weakSelf.alpha = 0;
                          // smoothly fade in image if it was downloaded over the network
                          [UIView animateWithDuration:0.25 animations:^{
                              weakSelf.alpha = 1;
                          }];
                      }
                      
                  } failure:nil];
}

@end
