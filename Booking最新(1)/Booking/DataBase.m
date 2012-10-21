//
//  DataBase.m
//  ChinaProvinceTest
//
//  Created by user on 12-3-22.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DataBase.h"
#import "ProvinceObject.h"




@implementation DataBase

static DataBase *db;
+(DataBase *)shareDataBase{
	if (db==nil) {
		db=[[DataBase alloc] init];
	}
	return db;
}

- (void)CopyDatabaseIfNeeded{
	
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *country =@"china_Province_city_zone";
    NSString *writableDBPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:country];
	//NSLog(@"writableDBPath-----%@",writableDBPath);
    success = [fileManager fileExistsAtPath:writableDBPath];
	
    if (success){
		[self OpenDatabase];
		return;
	}
	
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:country];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	[country release];
	
    if (!success){
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
	else {
		[self OpenDatabase];
	}
}

//打开数据库
-(BOOL)OpenDatabase{
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *country =@"china_Province_city_zone";
	NSString *path = [documentsDirectory stringByAppendingPathComponent:country];
	//NSLog(@"path-----%@",country);
	[country release];
	
    if(sqlite3_open([path UTF8String], &database) == SQLITE_OK){
		NSLog(@"------------open database success");
        return YES;
    } 
	else{
        sqlite3_close(database);
        NSLog(@"Error: open database file.");
        
		return NO;
    }
    return NO;
}
-(NSMutableArray *)searchProvinceTableInfo{
	NSMutableArray *arr=[[NSMutableArray alloc] init];
	if ([self OpenDatabase]) {
		sqlite3_stmt *stmt;//存方结果表的地址
		//sql语句创建在这里如果数据库打开失败就不用执行了
		NSString *sql=@"select * from T_Province;";
		if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
			//从结果表里按行取值 一个行里有两列
			
			while (sqlite3_step(stmt) == SQLITE_ROW) {
				//Person *group=[[Person alloc] init];
				ProvinceObject*province=[[ProvinceObject alloc]init];
				char *getType=(char *)sqlite3_column_text(stmt, 0);
				int   pid=sqlite3_column_int(stmt, 1);//和char简单类型不需要释放
				if (getType!=nil) {
					province.proName=[NSString stringWithUTF8String:getType];//这里person类被当作群这个对象 gid保存的是群id
				}
				  province.proId=pid;
				
				  [arr addObject:province];
				
				[province release];
			}
			sqlite3_finalize(stmt);
		}
		sqlite3_close(database);
	}
	return arr;
}
//搜索与省份id对应的城市
-(NSMutableArray *)searchCityInProvince:(NSString *)sql{
	NSMutableArray *arr=[[NSMutableArray alloc] init];
	if ([self OpenDatabase]) {
		sqlite3_stmt *stmt;
		if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
			while (sqlite3_step(stmt) == SQLITE_ROW) {
				
				//这里把省对象当作城市来用 自己偷懒了 
				ProvinceObject*city=[[ProvinceObject alloc]init];
				char *getType=(char *)sqlite3_column_text(stmt, 0);
				int   pId=sqlite3_column_int(stmt, 1);
				//城市的id也要选出来 后面选与市对应的县区 要用
				int  citySort=sqlite3_column_int(stmt, 2);
				
				
				    city.proId=pId;
				if (getType!=nil) {
					city.proName=[NSString stringWithUTF8String:getType];
				}
				city.cityId=citySort;
				[arr addObject:city];
				[city autorelease];
			}
			sqlite3_finalize(stmt);
		}
		sqlite3_close(database);
	}
	return [arr autorelease];
}
//这个不用解释了吧
-(NSMutableArray *)searchZoneInCity:(NSString *)sql{
	NSMutableArray *arr=[[NSMutableArray alloc] init];
	if ([self OpenDatabase]) {
		sqlite3_stmt *stmt;
		if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
			while (sqlite3_step(stmt) == SQLITE_ROW) {
				
				//这里把省的对象当作区来用 自己偷懒了 
				ProvinceObject*zone=[[ProvinceObject alloc]init];
				char *getType=(char *)sqlite3_column_text(stmt, 1);
				
				//所属城市的id也要选出来 
				int  citySort=sqlite3_column_int(stmt, 2);
				
				
				
				if (getType!=nil) {
					zone.proName=[NSString stringWithUTF8String:getType];
				}
				zone.cityId=citySort;
				[arr addObject:zone];
				[zone autorelease];
			}
			sqlite3_finalize(stmt);
		}
		sqlite3_close(database);
	}
	return [arr autorelease];
}








@end
