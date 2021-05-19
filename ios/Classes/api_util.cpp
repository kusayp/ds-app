//
//  api_util.cpp
//  Runner
//
//  Created by Philip Nartey on 21/02/2021.
//

#include <stdint.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
char *get_api_key() {
    return (char*)"26fa1c10671d11eba48a93382164fb6d";
}

char *get_api_url() {
    return (char*)"http://cop-dev-api.herokuapp.com/api/v1.0/";
}
