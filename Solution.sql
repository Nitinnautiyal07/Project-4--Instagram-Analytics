#1=Find the 5 oldest users of the Instagram from the database provided.

select *,max(created_at) as account_created_on from users 
        group by id 
        order by account_created_on limit 5;
        
#2= Find the users who have never posted a single photo on Instagram
create table inn(
select id from users
except
select distinct(user_id) from photos
)
select username from users u
right join inn n
on n.id=u.id;

#3=user who got most likes on a single photo
 
create table lk
(
select user_id,count(photo_id) as no_of_likes from likes
       group by user_id
       order by no_of_likes desc limit 13
);
select username,id,no_of_likes from users u
join lk l
on l.user_id=u.id;

#4= Identify and suggest the top 5 most commonly used hashtags on the platform.

select tag_name,tag_id,count(tag_id) as no_of_times_used_tag from photo_tags
join tags 
on tags.id=photo_tags.tag_id
       group by tag_id
       order by tag_id desc limit 5
       
#5=What day of the week do most users register on? Provide insights on when to schedule an ad campaign.

select dayname(created_at),count(id) from users
group by dayname(created_at)
order by count(id) desc limit 3  ;

##INVESTORS METRICS

#1Provide how many times does average user posts on Instagram. 

select user_id,count(id) as no_of_times_post from photos
       group by user_id
       order by no_of_times_post desc;

select count(id)/count(distinct(user_id)) as avg_user_post from photos;

       
#Also, provide the total number of photos on Instagram/total number of users

select count(id) as no_of_users from users;
select count(id) as no_of_potos from photos;

#2=provide data on users (bots) who have liked every single photo on the site

select  count(distinct(photo_id)) as total_photos from likes;#here the total no. of photos=257


select user_id,count(user_id) as no_of_times_liked from likes #from this query bot=who liked 257 times
       group by user_id 




       