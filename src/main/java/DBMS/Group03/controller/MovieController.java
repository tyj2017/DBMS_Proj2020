package DBMS.Group03.controller;
import DBMS.Group03.domain.PersonalRating;
import DBMS.Group03.domain.RatingnQuality;
import DBMS.Group03.domain.Ratings;
import DBMS.Group03.service.MoviesService;
import DBMS.Group03.domain.Movies;
import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/movies")
public class MovieController {
    @Autowired
    private MoviesService moviesService;

    @RequestMapping("/findMovies")
    public String findMovies(Movies movies,Model model){
        System.out.println("查找电影");
        movies.split_actor_name();
        movies.split_director_name();
        //System.out.println(movies.getActor_first_name());
        //System.out.println(movies.getActor_last_name());
        System.out.println(movies.getSearchString());
        List<String> list=moviesService.findMovies(movies);
        for (int i=0;i<list.size();i++){
            String temp=list.get(i);
            list.set(i,temp+"\n");
        }
        //System.out.println(list.get(1));
        model.addAttribute("MovieList", list);
        return "movieList";
    }

    @RequestMapping("/findRatings")
    public String findRatings(Movies movies, Model model){
        System.out.println("查找评分");
        movies.split_actor_name();
        movies.toInteger();
        System.out.println("get Year Range "+movies.getyR2());
        System.out.println("get actor name "+movies.getActor());
        List<Ratings> list=moviesService.findRatings(movies);
        System.out.println(list.toString());
        model.addAttribute("MovieRating", list);
        return "ratingList";
    }

    @RequestMapping("/findPersonalRatings")
    public String findPersonalRatings(Movies movies, Model model){
        //跳转到下一页面，操作在此页面上完成
        return "personalRatings";
    }

    @RequestMapping("/findPersonalRatingsAjax")
    @ResponseBody
    public String findPersonalRatingsAjax(String name){
        String[] full =name.split(" ");
        String input="%"+full[0]+"%"+full[1]+"%";
        List<PersonalRating> list=moviesService.findPersonalRatingsAjax(input);
        /*
        System.out.println(list.toString());
        ArrayList<Integer> years=new ArrayList<>();
        ArrayList<Float> ratings=new ArrayList<>();

        for(PersonalRating p: list){
            years.add(p.getYear());
            ratings.add(p.getAvgRating());
        }

        Map<String,List> map=new HashMap<String, List>();
        map.put("year",years);
        map.put("ratings",ratings);
        System.out.println(map.get("year"));
        System.out.println(map.get("ratings"));
         */
        //直接调用重写的toString方法将list转换成JSON
        System.out.println(list.toString());
        return list.toString();
    }

    @RequestMapping("/findRatingnQuality")
    public String findRatingnQuality(){
        return "RatingsandQuality";
    }

    @RequestMapping("/findRatingnQualityAjax")
    @ResponseBody
    public String findRatingnQualityAjax(String name){
        String[] full =name.split(" ");
        String input="%"+full[0]+"%"+full[1]+"%";
        List<RatingnQuality> list=moviesService.findRatingnQualityAjax(input);
        System.out.println(list.toString());
        return list.toString();
    }


}
