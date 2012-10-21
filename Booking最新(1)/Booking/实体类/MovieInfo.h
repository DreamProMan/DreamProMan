//
//  MovieInfo.h
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject

// 影片信息
@property (nonatomic, copy)   NSString *movieID;              // 影片编号
@property (nonatomic, copy)   NSString *movieName;            // 影片名称
@property (nonatomic, assign) NSString *duration;            // 放映时长
@property (nonatomic, copy)   NSString *director;             // 导演
@property (nonatomic, copy)   NSString *cast;                 // 主演
@property (nonatomic, copy)   NSString *thumbnail;            // 小图
@property (nonatomic, retain) UIImage *cachedThumbnail;       // 缓存小图
@property (nonatomic, copy)   NSString *poster;               // 大图
@property (nonatomic, copy)   NSString *filmDate;             // 上映时间
@property (nonatomic, copy)   NSString *filmClass;            // 影片类型
@property (nonatomic, copy)   NSString *filmArea;             // 影片地区
@property (nonatomic, copy)   NSString *filmDesc;             // 影片描述
@property (nonatomic, assign) NSString *showCount;           // 本日上映场次数

-(id)initWithMovieID:(NSString*)moviewID movieName:(NSString*)movieName duration:(NSString*)duration director:(NSString*)director cast:(NSString *)cast thumbnail:(NSString*)thumbnail cachedThumbnail:(UIImage*)cachedThumbnail poster:(NSString*)poster filmDate:(NSString*)filmDate filmClass:(NSString*)filmClass filmArea:(NSString*)filmArea filmDesc:(NSString*)filmDesc showCount:(NSString*)showCount;
@end 
