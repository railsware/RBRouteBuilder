//
// Created by AlexDenisov on 4/3/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#ifdef __cplusplus
#define rb_extern               extern "C"
#define rb_route_builder_begin  extern "C" {
#define rb_route_builder_end    }
#else
#define rb_extern
#define rb_route_builder_begin /* Npthing */
#define rb_route_builder_end   /* Nothing */
#endif

rb_extern id rb_route_builder(NSString *rootPath);
