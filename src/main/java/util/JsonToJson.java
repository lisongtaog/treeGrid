package util;

import pojo.TreeGridItem;

import java.util.ArrayList;
import java.util.List;

public class JsonToJson {


    public static String jsonToJson(List<TreeGridItem> list) {

        String treeGridJson = "{";
        List<TreeGridItem> list1 = isOrNotChild(list.get(0).getId(), list);
        treeGridJson += tools0(list.get(0).getName(), list.get(0).getValue(), list, list1);
        treeGridJson += "}";
        return treeGridJson;
    }

    /**
     * 单个节点的生成
     * @param                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            stringName
     * @param stringValue
     * @return
     */
    public static String single(String stringName, String stringValue) {
        if ("".equals(stringValue) || stringValue == null) {
            stringValue = "";
        }
        String treeGridJson = "\"" + stringName + "\":\"" + stringValue + "\"";
        return treeGridJson;
    }

    /**
     * 判断是否有子节点，没有返回null,有返回子节点的集合。
     * @param pid
     * @param list
     * @return
     */
    public static List<TreeGridItem> isOrNotChild(String pid, List<TreeGridItem> list) {
        List<TreeGridItem> list1 = new ArrayList<TreeGridItem>();
        for (int i = 0; i < list.size(); i++) {
            if (pid.equals(list.get(i).get_parentId())) {
                list1.add(list.get(i));
            }
        }
        if (list1.size() > 0) {
            return list1;
        } else {
            return null;
        }
    }

    /**
     *  生成json对象{}中的具体属性。
     * @param stringName
     * @param stringValue
     * @param list0
     * @param list1
     * @return
     */
    public static String tools(String stringName, String stringValue, List<TreeGridItem> list0, List<TreeGridItem> list1) {
        String treeGridJson = "";
        if (list1 == null) {
            treeGridJson += single(stringName, stringValue);
        } else {
            for (int i = 0; i < list1.size(); i++) {
                List<TreeGridItem> list2 = isOrNotChild(list1.get(i).getId(), list0);
                if (list2 == null) {
                    treeGridJson += single(list1.get(i).getName(), list1.get(i).getValue());
                    if (i == (list1.size() - 1)) {
                        treeGridJson += "";
                    } else {
                        treeGridJson += ",";
                    }
                } else {
                    treeGridJson += tools0(list1.get(i).getName(), list1.get(i).getValue(), list0, list2);
                    if (i == (list1.size() - 1)) {
                        treeGridJson += "";
                    } else {
                        treeGridJson += ",";
                    }
                }
            }
        }
        return treeGridJson;
    }

    /**
     *  判断json对象的类型，是[]还是{}。
     *  {}  类型  直接调用tool来生成对象。
     *  []  类型  进入[i]，多个{}再调用tool来生成数组对象。
     * @param stringName
     * @param stringValue
     * @param list0
     * @param list1
     * @return
     */
    public static String tools0(String stringName, String stringValue, List<TreeGridItem> list0, List<TreeGridItem> list1) {

        String treeGridJson = "";
        if (list1 == null) {
            treeGridJson += single(stringName, stringValue);
        } else {
            if (stringName.indexOf("[]") > 0) {
                treeGridJson += "\"" + stringName + "\":[";
                for (int n = 0; n < list1.size(); n++) {
                    List<TreeGridItem> list2 = isOrNotChild(list1.get(n).getId(), list0);
                    if (list2 == null) {

                    } else {
                        treeGridJson += "{";
                        treeGridJson += tools(list1.get(n).getName(), list1.get(n).getValue(), list0, list2);
                        treeGridJson += "}";
                        if (n == (list1.size() - 1)) {
                            treeGridJson += "";
                        } else {
                            treeGridJson += ",";
                        }
                    }
                }
                treeGridJson += "]";
                return treeGridJson;
            } else {
                treeGridJson += "\"" + stringName + "\":{";
                treeGridJson += tools(stringName, stringValue, list0, list1);
                treeGridJson += "}";
                return treeGridJson;
            }
        }
        return treeGridJson;
    }
}