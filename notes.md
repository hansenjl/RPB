Race Training Planner

User
has_many races
Has_many workouts through Races
Has_many workouts (they created)


Race
Belongs_to :user
Has_many :sessions
Has_many workouts through sessions
Title:string
category:string
Total Distance (miles): integer
Description: string

 rails g resource Race title category distance:integer description



Session
Date: datetime
Complete: boolean, default false
Feeling: string
Belongs_to :race
Belongs_to :workout


 rails g resource Session date:datetime feeling:string race:belongs_to

Workout
Has many sessions
Has many races through sessions
Belongs_to user
Type:string
Distance: integer
Pace: string


 rails g resource Workout user_id:integer category pace:string distance:integer
