//
//  DfpDobbyChange.m
//  imeituanDylib
//
//  Created by qitmac001140 on 2022/7/18.
//

#import "DfpDobbyChange.h"
#import <mach-o/dyld.h>
#import <DobbyX/dobby.h>
#import "JsonUtils.h"
#import "CommonConstant.h"

#include <sys/mount.h>

@implementation DfpDobbyChange

+ (void)load{

    static uintptr_t sum_address_offset2 = 0x10411D4B4;

    static uintptr_t sum_address_offset433 = 0x104101DA0;
    static uintptr_t sum_address_offset434 = 0x1041020AC;
    static uintptr_t sum_address_offset435 = 0x1041023B8;

    static uintptr_t sum_address_offset200 = 0x1040EB380;
    static uintptr_t sum_address_offset13 = 0x1040FCA1C;
    static uintptr_t sum_address_offset401 = 0x1040ED0A0;

    
//  static uintptr_t sum_address_offsetc1 = 0x1040F4754;
    static uintptr_t sum_address_offsetc419 = 0x1040DD4B4;
    static uintptr_t sum_address_offsetc270 = 0x1040F4824;
    
//    id sub_1040F6290()
    static uintptr_t sum_address_offsetc2 = 0x1040F6290;
    
    
    static uintptr_t sum_address_offsetc3 = 0x1040DB360;
    static uintptr_t sum_address_offsetc4 = 0x1040F322C; //0x1040F3218
    static uintptr_t sum_address_offsetc5 = 0x10412117C;
    static uintptr_t sum_address_offsetc6 = 0x1040EC210;
    static uintptr_t sum_address_offsetc7 = 0x1040EC210;
    static uintptr_t sum_address_offsetc8 = 0x1040FE770;
    static uintptr_t sum_address_offsetc9 = 0x1040DE560;
    static uintptr_t sum_address_offsetc10 = 0x1040EEFA8;
    
    uintptr_t slide = _dyld_get_image_vmaddr_slide(0);

    uintptr_t sum_address2 = (sum_address_offset2 + slide);
    
    uintptr_t sum_address433 = (sum_address_offset433 + slide)  ;
    uintptr_t sum_address434 = (sum_address_offset434 + slide);
    uintptr_t sum_address435 = (sum_address_offset435 + slide);
    uintptr_t sum_address200 = (sum_address_offset200 + slide);
    uintptr_t sum_address13 = (sum_address_offset13 + slide);
    uintptr_t sum_address401 = (sum_address_offset401 + slide);

//    uintptr_t sum_addressc1 = (sum_address_offsetc1 + slide);
    uintptr_t sum_addressc419 = (sum_address_offsetc419 + slide);
    uintptr_t sum_addressc270 = (sum_address_offsetc270 + slide);

    uintptr_t sum_addressc2 = (sum_address_offsetc2 + slide);

    uintptr_t sum_addressc3 = (sum_address_offsetc3 + slide);
    uintptr_t sum_addressc4 = (sum_address_offsetc4 + slide);
    uintptr_t sum_addressc5 = (sum_address_offsetc5 + slide);
    uintptr_t sum_addressc6 = (sum_address_offsetc6 + slide);
    uintptr_t sum_addressc7 = (sum_address_offsetc7 + slide);

    uintptr_t sum_addressc8 = (sum_address_offsetc8 + slide);
    uintptr_t sum_addressc9 = (sum_address_offsetc9 + slide);
    uintptr_t sum_addressc10 = (sum_address_offsetc10 + slide);

    
    DobbyHook((void *)sum_address2, func_replace_B, (void *)&func_orig_B);
    DobbyHook((void *)sum_address433, func_replace_433, (void *)&func_orig_433);
    DobbyHook((void *)sum_address434, func_replace_434, (void *)&func_orig_434);
    DobbyHook((void *)sum_address435, func_replace_435, (void *)&func_orig_435);
    DobbyHook((void *)sum_address200, func_replace_200, (void *)&func_orig_200);
    DobbyHook((void *)sum_address13, func_replace_13, (void *)&func_orig_13);
    DobbyHook((void *)sum_address401, func_replace_401, (void *)&func_orig_401);
//    DobbyHook((void *)sum_addressc1, func_replace_c1, (void *)&func_orig_c1);
//    DobbyHook((void *)sum_addressc419, func_replace_c419, (void *)&func_orig_c419);
//    DobbyHook((void *)sum_addressc270, func_replace_c270, (void *)&func_orig_c270);

//    DobbyHook((void *)sum_addressc2, func_replace_c2, (void *)&func_orig_c2);
    
//    DobbyHook((void *)sum_addressc3, func_replace_c3, (void *)&func_orig_c3);
//    DobbyHook((void *)sum_addressc4, func_replace_c4, (void *)&func_orig_c4);
//    DobbyHook((void *)sum_addressc5, func_replace_c5, (void *)&func_orig_c5);
//    DobbyHook((void *)sum_addressc6, func_replace_c6, (void *)&func_orig_c6);
//    DobbyHook((void *)sum_addressc7, func_replace_c7, (void *)&func_orig_c7);
//    DobbyHook((void *)sum_addressc8, func_replace_c8, (void *)&func_orig_c8);
//        DobbyHook((void *)sum_addressc9, func_replace_c9, (void *)&func_orig_c9);
//    DobbyHook((void *)sum_addressc10, func_replace_c10, (void *)&func_orig_c10);


}




id (*func_orig_B)(id a1);
id func_replace_B(id a1){
  

    NSString * arg1 = a1;
    
    //[arg1 isEqualToString:@"0"]
//    if([a1 containsString:@"80db32e4ceb6c96a5d35b0ee695a0c57983cf008c58978f83afd7755"]){
//        NSLog(@"func_replace_B %@\n%@", a1, [NSThread callStackSymbols]);
////        arg1 = @"1";
//    }
    
    if ([a1 containsString:@"\"33\":\"{"]) {
        arg1 =@"{\"33\":\"{\\\"0\\\":-,\\\"1\\\":\\\"-\\\",\\\"2\\\":\\\"\\\",\\\"3\\\":\\\"-\\\",\\\"4\\\":\\\"-\\\",\\\"5\\\":\\\"-\\\",\\\"6\\\":\\\"\\\",\\\"7\\\":\\\"-\\\",\\\"8\\\":\\\"-\\\",\\\"9\\\":\\\"-\\\",\\\"10\\\":\\\"-\\\",\\\"11\\\":\\\"\\\",\\\"12\\\":\\\"\\\",\\\"13\\\":\\\"\\\"}\",\"1\":\"\",\"2\":\"\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"\",\"9\":\"\",\"44\":\"\"}";
    }
    
//    if([a1 containsString:@"meituan.app/imeituan"]){
//        NSLog(@"func_replace_B %@\n%@", a1, [NSThread callStackSymbols]);
////        arg1 = [a1 stringByReplacingOccurrencesOfString:@"imeituan.app/imeituan" withString:@"imeituan.app/imeituan_orig_ne"];
//
//    }
//"9GC8R2VCR4", @"335KJ8VWDZ", @"66973D2839", @"3PJE4J3T6A",@"5R9NF72W4B"
    if([a1 containsString:@"9GC8R2VCR4"]
       ||[a1 containsString:@"335KJ8VWDZ"]
       ||[a1 containsString:@"66973D2839"]
       ||[a1 containsString:@"3PJE4J3T6A"]
       ||[a1 containsString:@"5R9NF72W4B"]

       ){
        NSLog(@"func_replace_B %@\n%@", a1, [NSThread callStackSymbols]);
        arg1 = @"T3ZLXP4K5B";
    }
    id res = func_orig_B(arg1);

    return res;
}


//433 id sub_104101DA0()
id (*func_orig_433)();
id func_replace_433(){
    id res = func_orig_433();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:[STORE stringForKey:DATE_M433] forKey:@"value"];
    NSString *m433 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m433:%@  orig:%@",m433,res);
    return m433;
    
}


//434 id sub_1041020AC()
id (*func_orig_434)();
id func_replace_434(){
    id res = func_orig_434();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:[STORE stringForKey:DATE_M434] forKey:@"value"];
    NSString *m434 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m434:%@  orig:%@",m434,res);
    return m434;
    
}
//435 id sub_1041023B8()
id (*func_orig_435)();
id func_replace_435(){
    id res = func_orig_435();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:[STORE stringForKey:DATE_M435] forKey:@"value"];
    NSString *m435 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m435:%@  orig:%@",m435,res);
    return m435;
    
}
//200 id sub_1040EB380()
id (*func_orig_200)();
id func_replace_200(){
    id res = func_orig_200();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:[STORE stringForKey:DATE_M200] forKey:@"value"];
    NSString *m200 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m200:%@  orig:%@",m200,res);
    return m200;
    
}
//13 id sub_1040FCA1C()
id (*func_orig_13)();
id func_replace_13(){
    id res = func_orig_13();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"0" forKey:@"value"];
    NSString *m13 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m13:%@  orig:%@",m13,res);
    return m13;
}

//m401 id sub_1040ED0A0()
id (*func_orig_401)();
id func_replace_401(){
    id res = func_orig_401();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    NSString *str401 = [NSString stringWithFormat:@"%@@\/dev\/disk0s1s1",[STORE stringForKey:UUID_M401]];
    [param setObject:@1 forKey:@"code"];
    [param setObject:str401 forKey:@"value"];
    NSString *m401 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m401:%@  orig:%@",m401,res);
    return m401;
}

//id sub_1040DD4B4() res    __NSCFString *    @"{\n  \"value\" : \"T3ZLXP4K5B\",\n  \"code\" : 1\n}"    0x00000002827c6080
//m419
id (*func_orig_c419)();
id func_replace_c419(){
    id res = func_orig_c419();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"T3ZLXP4K5B" forKey:@"value"];
    NSString *m419 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m419:%@  orig:%@",m419,res);
    return m419;
}



//meituan.app/imeituan
//id sub_1040F4824() 270
id (*func_orig_c270)();
id func_replace_c270(){
    id res = func_orig_c270();
    NSString *arg1 = [res stringByReplacingOccurrencesOfString:@"imeituan.app\\/imeituan" withString:@"imeituan.app\\/imeituan_orig_new"];

    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:arg1 forKey:@"value"];
    NSString *m270 = [JsonUtils dictionaryToJsonString:param];
    NSLog(@"m600-->Change m270:%@  orig:%@",m270,res);
    return m270;
}


//id sub_1040F4C7C()

id (*func_orig_c2)();
id func_replace_c2(){
    id res = func_orig_c2();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"0" forKey:@"value"];
    NSString *m419 = [JsonUtils dictionaryToJsonString:param];
    return m419;
}

//id (*func_orig_c2)(unsigned int * a1);
//id func_replace_c2(unsigned int * a1){
//    id res = func_orig_c2(a1);
//
//    return res;
//}

//id sub_1040F4754() res    __NSCFString *    @"{\n  \"value\" : \"1\",\n  \"code\" : 1\n}"    0x00000002827fa500

//id (*func_orig_c1)();
//id func_replace_c1(){
//    id res = func_orig_c1();
//
//    return res;
//}
//



//id sub_1040DB360() -
id (*func_orig_c3)();
id func_replace_c3(){
    id res = func_orig_c3();
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"1" forKey:@"value"];
    NSString *m419 = [JsonUtils dictionaryToJsonString:param];
    return m419;
//    return res;
}

//id sub_1040F3218()
id (*func_orig_c4)(void *a1,unsigned long long a2);
id func_replace_c4(void *a1,unsigned long long a2){
//    id res = func_orig_c4(a1,a2);

    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"1" forKey:@"value"];
    NSString *m = [JsonUtils dictionaryToJsonString:param];
    return m;
//    return res;

}

//id sub_10412117C()
id (*func_orig_c5)();
id func_replace_c5(){
    id res = func_orig_c5();

    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"1" forKey:@"value"];
    NSString *m419 = [JsonUtils dictionaryToJsonString:param];
    return m419;
//    return res;

}

//id sub_1040EC210()
id (*func_orig_c6)();
id func_replace_c6(){
    id res = func_orig_c6();

    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"1" forKey:@"value"];
    NSString *m419 = [JsonUtils dictionaryToJsonString:param];
    return m419;
//    return res;

}


//void __fastcall sub_1040F3A28(void *a1) //a1 = errkey
void (*func_orig_c7)(void *a1);
void func_replace_c7(void *a1){
    
    func_orig_c7(a1);
}


//id sub_1040F4C88() //hook 有问题

id (*func_orig_c8)();
id func_replace_c8(){
    id res = func_orig_c8();

    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    [param setObject:@1 forKey:@"code"];
    [param setObject:@"1" forKey:@"value"];
    NSString *m419 = [JsonUtils dictionaryToJsonString:param];
    return m419;
//    return res;

}

//id sub_1040FFE5C() //不太像

void (*func_orig_c9)(unsigned long long  *a1);
void func_replace_c9(unsigned long long   *a1){
    
    func_orig_c9(a1);
}

id (*func_orig_c10)(id a1);
id func_replace_c10(id a1){
    
    id res = func_orig_c10(a1);
//    NSMutableDictionary *resc = res;
//    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
//    [param setObject:@1 forKey:@"code"];
//    [param setObject:@"1" forKey:@"value"];
//    NSString *ms = [JsonUtils dictionaryToJsonString:param];
//
    
//    [res setObject:@"1" forKey:@"274"];
    
    return res;
}





//id __usercall sub_1040F322C@<X0>(void *a1@<X0>, __int64 a2@<X8>)

//id __fastcall sub_1040EEFA8(id a1)
@end





