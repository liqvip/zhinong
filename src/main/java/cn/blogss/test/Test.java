package cn.blogss.test;/*
    create by LiQiang at 2018/6/6   
*/

import java.util.HashMap;
import java.util.Map;

public class Test {

    InnerTest[] table;

    static class InnerTest{
        final String name;
        final String password;

        public InnerTest(String name,String password) {
            this.name = name;
            this.password = password;
        }
    }

    InnerTest newVal(String name,String password){
        return new InnerTest(name,password);
    }

    final void putVal(int i,String name,String password){
        InnerTest[]  tab ;

        if((tab=table) == null ){
           tab = new InnerTest[6] ;
        }

        tab[i] = newVal(name,password);

    }

    public static void main(String[] args) {
        /*Map<String,String> map = new HashMap<>();

        map.put("name","liqiang");
        System.out.println("name:"+map.get("name"));

        System.out.println(Integer.toBinaryString("aaa".hashCode())+"-->"+Integer.toBinaryString("aaa".hashCode()
                ^("aaa".hashCode()>>>16)));
        System.out.println(Integer.toBinaryString("bbb".hashCode())+"-->"+Integer.toBinaryString("bbb".hashCode()
                ^("bbb".hashCode()>>>16)));*/
    }
}
