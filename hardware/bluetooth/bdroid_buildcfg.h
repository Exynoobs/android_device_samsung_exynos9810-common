/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#if !defined(OS_GENERIC)

static inline const char* getBTDefaultName()
{
    return "Galaxy S9";
}

#define BTM_DEF_LOCAL_NAME getBTDefaultName()
#endif /* OS_GENERIC */

/*
 * Toggles support for vendor specific extensions such as RPA offloading,
 * feature discovery, multi-adv etc.
 */
#define BLE_VND_INCLUDED TRUE

/* 'strings libbluetooth.so' */
#define BTA_AV_SINK_INCLUDED TRUE

#endif /* _BDROID_BUILDCFG_H */
