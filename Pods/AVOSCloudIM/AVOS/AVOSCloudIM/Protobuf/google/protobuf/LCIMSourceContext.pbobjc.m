// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: google/protobuf/source_context.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(LCIM_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define LCIM_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if LCIM_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/LCIMProtocolBuffers_RuntimeSupport.h>
#else
 #import "LCIMProtocolBuffers_RuntimeSupport.h"
#endif

#if LCIM_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/LCIMSourceContext.pbobjc.h>
#else
 #import "google/protobuf/LCIMSourceContext.pbobjc.h"
#endif
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - LCIMSourceContextRoot

@implementation LCIMSourceContextRoot

@end

#pragma mark - LCIMSourceContextRoot_FileDescriptor

static LCIMFileDescriptor *LCIMSourceContextRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static LCIMFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    LCIM_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[LCIMFileDescriptor alloc] initWithPackage:@"google.protobuf"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - LCIMSourceContext

@implementation LCIMSourceContext

@dynamic fileName;

typedef struct LCIMSourceContext__storage_ {
  uint32_t _has_storage_[1];
  __unsafe_unretained NSString *fileName;
} LCIMSourceContext__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (LCIMDescriptor *)descriptor {
  static LCIMDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "fileName",
        .dataTypeSpecific.className = NULL,
        .number = LCIMSourceContext_FieldNumber_FileName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(LCIMSourceContext__storage_, fileName),
        .flags = LCIMFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    LCIMDescriptor *localDescriptor =
        [LCIMDescriptor allocDescriptorForClass:[LCIMSourceContext class]
                                     rootClass:[LCIMSourceContextRoot class]
                                          file:LCIMSourceContextRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(LCIMSourceContext__storage_)
                                         flags:LCIMDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
