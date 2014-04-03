//
// Created by AlexDenisov on 4/3/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#ifdef __cplusplus
#define rb_extern               extern "C"
#else
#define rb_extern
#endif

rb_extern id rb_route_builder(NSString *rootPath);
