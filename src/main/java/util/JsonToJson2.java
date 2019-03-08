package util;

import pojo.TreeGridItem;

import java.util.ArrayList;
import java.util.List;

public class JsonToJson2 {


    public static String jsonToJson(List<TreeGridItem> list) {

        String treeGridJson = "{";
        List<TreeGridItem> list1 = isOrNotChild(list.get(0).getId(), list);
        treeGridJson += array(list.get(0).getId(), list.get(0).getName(), list.get(0).getValue(), list, list1,0);
        treeGridJson += "}";
        return treeGridJson;
    }

    /**
     * 总节点的生成
     *
     * @param stringName
     * @param pid
     * @param
     * @return
     */
    public static String array(String pid, String stringName, String stringValue, List<TreeGridItem> list0, List<TreeGridItem> list1,int flag) {

        if (stringName.indexOf("[]") > 0) {
            String treeGridJson = "\"" + stringName + "\":[";
            for (int n = 0; n < list1.size(); n++) {
                List<TreeGridItem> list6 = isOrNotChild(list1.get(n).getId(), list0);
                if (list6 == null) {

                } else {
                    treeGridJson += "{";
                    for (int m = 0; m < list6.size(); m++) {
                        List<TreeGridItem> list7 = isOrNotChild(list6.get(m).getId(), list0);
                        if (list7 == null) {
                            treeGridJson += single(list6.get(m).getName(), list6.get(m).getValue());
                            if (m == (list6.size() - 1)) {
                                treeGridJson += "";
                            } else {
                                treeGridJson += ",";
                            }
                        } else {
                            if (m == (list6.size() - 1)) {
                                flag = 0;
                            } else {
                                flag = 1;
                            }
                            treeGridJson += array(list6.get(m).getId(), list6.get(m).getName(), list6.get(m).getValue(), list0, list7,flag);
                            if (m == (list6.size() - 1)) {
                                treeGridJson += "";
                            } else {
                                treeGridJson += ",";
                            }
                        }
                    }
                    if (n == (list1.size() - 1)) {
                        treeGridJson += "}";
                    } else {
                        treeGridJson += "},";
                    }
                }
            }
            treeGridJson += "]";
            return treeGridJson;
        } else {
            String treeGridJson = "\"" + stringName + "\":{";

            for (int i = 0; i < list1.size(); i++) {

                if (list1.get(i).getName().indexOf("[]") > 0) {

                    treeGridJson += "\"" + list1.get(i).getName() + "\":[";
                    List<TreeGridItem> list3 = isOrNotChild(list1.get(i).getId(), list0);
                    if (list3 == null) {

                    } else {
                        for (int j = 0; j < list3.size(); j++) {
                            List<TreeGridItem> list4 = isOrNotChild(list3.get(j).getId(), list0);
                            if (list4 == null) {

                            } else {
                                treeGridJson += "{";
                                for (int k = 0; k < list4.size(); k++) {
                                    List<TreeGridItem> list5 = isOrNotChild(list4.get(k).getId(), list0);
                                    if (list5 == null) {
                                        treeGridJson += single(list4.get(k).getName(), list4.get(k).getValue());
                                        if (k == (list4.size() - 1)) {
                                            treeGridJson += "";
                                        } else {
                                            treeGridJson += ",";
                                        }
                                    } else {
                                        if (k == (list4.size() - 1)) {
                                            flag = 0;
                                        } else {
                                            flag = 1;
                                        }

                                        treeGridJson += array(list4.get(k).getId(), list4.get(k).getName(), list4.get(k).getValue(), list0, list5, flag);
                                        if (k == (list4.size() - 1)) {
                                            treeGridJson += "";
                                        } else {
                                            treeGridJson += ",";
                                        }
                                    }
                                }
                                if (j == (list3.size() - 1)) {
                                    treeGridJson += "}";
                                } else {
                                    treeGridJson += "},";
                                }
                            }
                        }
                    }
                    if (i == (list1.size() - 1)) {
                        treeGridJson += "]";
                    } else {
                        treeGridJson += "],";
                    }
                } else {

                    List<TreeGridItem> list2 = isOrNotChild(list1.get(i).getId(), list0);

                    if (list2 == null) {
                        treeGridJson += single(list1.get(i).getName(), list1.get(i).getValue());
                        if (i == (list1.size() - 1)) {
                            treeGridJson += "";
                        } else {
                            treeGridJson += ",";
                        }
                    } else {
                        if (i == (list1.size() - 1)) {
                            flag = 0;
                        } else {
                            flag = 1;
                        }
                        treeGridJson += array(list1.get(i).getId(), list1.get(i).getName(), list1.get(i).getValue(), list0, list2,flag);
                        if (i == (list1.size() - 1)) {
                            treeGridJson += "}";
                        } else {
                            treeGridJson += "},";
                        }
                    }
                }
            }
            if (flag > 0) {
                treeGridJson += "}";
            } else {
                treeGridJson += "}";
            }
            return treeGridJson;
        }
    }

    /**
     * 单个节点的生成
     *
     * @param stringName
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
     * 判断是否有子节点
     *
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
}
