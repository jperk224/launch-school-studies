# problem
# take in a float b/t 0 and 360
# return a string representing an angle in degrees, minutes, and seconds
  # degree symbol degrees
  # single quote minutes
  # double quote seconds
  # 360 can be 360 or 0
# degree has 60 minutes
# minute has 60 seconds


# examples/edges
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# ds/algo
# get the div and the mod of the float divided by 1
  # the div is degrees
  # the mod/remainder is minutes
    # get the product of 60 and the remainder
      # get the div an mod of the product divided by 1
        # the div is minutes
          # the mod/remainder is seconds
            # get the product of 60 and the mod/remiander
            # floor the result to get truncated minutes
# interpolate the string to the desired result

# code
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(float)
  degrees, remainder = float.divmod(1)
  minutes, remainder = (remainder * MINUTES_PER_DEGREE).divmod(1)
  seconds = (remainder * SECONDS_PER_MINUTE).floor
  format("%d#{DEGREE}%02d'%02d", degrees, minutes, seconds)
end

p dms(93.034773) == %(93°02'05)
