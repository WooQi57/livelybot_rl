## 143

light thigh and feet.

## 142
can't learn to balance after landing.

kill if yaw > 45 degrees.higher friction.
add tracking vel hard

## 141
try training only forward speed.

## 140
better for feet dist. value function not converge and training failed. Jumping direction not correct.

kill  if feet dist > 0.3， increase feet_distance from 0.2 to 0.5

## 139
These two are similar. This one has higher vel tracking reward. But the gait is terrible. Spread too. But 138 is better in gaits.

based on 138. NO ROTATION COMMAND! as it's difficult to control in the air pose.

## 138
forward velocity 0.3-0.6. 
-
## 137
why still jumping too high? can jump forward but not accurate.

height discrete rew from 10 to 5. increased cmd following. lin 2 to 3

## 136
better, for spreading. but one forward and one backward. vel tracking is trash.

based on 135, restrict knee and feet distance with adding the abs

## 135
too spread. can go forward. jumping not that high. It's useful.

jumping height 0.45-0.55, jumping buffer always 1. task completion restricted to +-0.02

## 134
can learn to jump forward, but jumping too high. spread too much.

reduce jumping height to 0.5-0.55
twice the reward for tracking

## 133
not moving according to cmd.

add commands to observation. (Turns out the target height was not previously in the obs!)
add tracking_lin_vel tracking_ang_vel

## 132
can jump after 100 steps. optimize to wrong direction afterwards.

based on 131. light calf 

## 131
more feet distance rew. add ang vel rewad. use box feet

## 130
spin too much

kill if h<0.2

## 129
not quite useful, legs spread a lot. Try twice the reward.

add feet orientation in reward. 

## 128
much better, land with frog legs. But feet spread a lot.
phase becomes 0 when in air, add contact in the observation.

## 127
try to use exp for height
better for the first 50 steps, drops after 400 steps


## 126
still can't land.

add default pose

## 125
grad explode 
collision 0.1

## 124
found the contradiactory between collision and height.

orientation from 5 to 10

## 123
based on 122, add feet distance and knee distance. obs has no vel command

## 122
no vel, has height rew. collision penalty include roll/pitch fall

## 121
not learning. need more heuristic

track velocity, no height rew

## conclusion for now
go back to using clip_action=18, use self.actions for penalty not raw 


## 120
can't learn, keep dying.

use self.actions instead.
add tracking velocity

## 119
can't learn, explode
add jump height target 0.5-0.6, scale 0.5
still penalty on raw_action, 1e-5

## 118
the action still goes wild. it's not learning in the correct direction. maybe because the lack of true goal?
punishing the raw actions won't help.

try penalty on raw_action output, increase joint_pos to 1

## 117
still wild.

add vel penalty

## 116
no use, can't learn to balance. maybe action penalty too small

add action penalty for not too large
don't clip the reward to be positive
based on 115

## 115
not helpful, action still too large

action clip to 4 (before scaling)
collision -1

## 114
FOUND THE BUG! ACTION_SCALE IS NOT USED IN REF_GEN!
no jumping, no smoothing
roll pitch termination from 30 to 60 degrees
collision -1

## 113
still use diff and ref in the obs
decrease joint_pos to 0.1
decrease collision to -5
increase alive to 2

## 112
no use, still not learning towards the wrong direction. Keep falling.

add diff in obs, increase joint_pos to 1.6
increase orientation reward from 1 to 5
add alive



## 111
not learning. total reward is negative.

add ref in the obs, height ref 0-0.55

## 110
not learning! The problem is not with height reward

try height ref 0, based on 109

## 109
keep killing itself

no air time, less jumping h and v

## 108
no use, keep killing itself

terminate if pitch and roll exceed 30 degrees

## 107
rotate in the air.

add penalty for height lower than 0.15
sampling jumping<0.5
collision -10
no contact force reward

## 106
really wild behavior, but can jump(see video)

use residual policy to complement the ref traj


## 105
can't learn the ref joints, because it contradicts going up in the first place

jump only, when standing on the ground   
obs has height   
use ref for bending knees   
period 2s


jumping_height = 2.   
jumping_vel = 2.   
joint_pos = 1.6                 # 1.6   
feet_air_time = 1.   
feet_contact_forces = 0.1  #-0.01   
orientation = 1.   
action_smoothness = -0.002    
collision = -1.   