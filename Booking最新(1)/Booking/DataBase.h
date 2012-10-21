//
//  DataBase.h
//  ChinaProvinceTest
//
//  Created by user on 12-3-22.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>





@interface DataBase : NSObject {
	sqlite3 *database;

}
+(DataBase *)shareDataBase;
- (void)CopyDatabaseIfNeeded;
-(BOOL)OpenDatabase;
-(NSMutableArray *)searchProvinceTableInfo;
-(NSMutableArray *)searchCityInProvince:(NSString *)sql;
-(NSMutableArray *)searchZoneInCity:(NSString *)sql;

@end
