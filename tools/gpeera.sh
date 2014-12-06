#!/sbin/sh
#~~PROPERTY OF ZEROINFINITY @ XDA-DEVELOPERS
#~~DO NOT STEAL OF COPY!

echo "" >> /system/build.prop
echo "# Project ERA by ZeroInfinity (GPE/AOSP version)" >> /system/build.prop
echo "audio.converter.samplerate.preferred=libsamplerate" >> /system/build.prop
echo "audio.converter.samplerate.libsamplerate.quality=best" >> /system/build.prop
echo "defaults.pcm.rate_converter=samplerate_best" >> /system/build.prop
echo "AUDIODRIVER=alsa" >> /system/build.prop
echo "ro.sound.driver=alsa" >> /system/build.prop
echo "av.offload.enable=true" >> /system/build.prop
echo "audio.offload.buffer.size.kb=32" >> /system/build.prop
echo "audio.offload.gapless.enabled=true" >> /system/build.prop
echo "av.streaming.offload.enable=true" >> /system/build.prop
echo "lpa.decode=false" >> /system/build.prop
echo "tunnel.decode=true" >> /system/build.prop
echo "lpa.use-stagefright=false" >> /system/build.prop
echo "lpa.releaselock=false" >> /system/build.prop
echo "tunnel.audiovideo.decode=true" >> /system/build.prop
echo "af.resampler.quality=4" >> /system/build.prop
echo "" >> /system/build.prop
echo "# HTC specific audio properties" >> /system/build.prop
echo "htc.audio.swalt.enable=1" >> /system/build.prop
echo "htc.audio.swalt.mingain=2072" >> /system/build.prop

sed -i '/af.resampler.quality/s/255/4/g' /system/build.prop