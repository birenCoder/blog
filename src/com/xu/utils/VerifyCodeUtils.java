package com.xu.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class VerifyCodeUtils {
    //设置验证码字符
    private static final String VERIFIY_CODES = "23456789ABCDEFGHJKLMNQRSTUVWYZabcdefghjkmnqrstuvwyz";
    /**
     *     生成验证码
     * @param veifiySize 验证码个数
     * @return
     */
    public static String createVerifyCode(int veifiySize){
        //缓冲流字符串--保存验证码
        StringBuffer verifiyCode = new StringBuffer(veifiySize);
        //源字符
        String code = VERIFIY_CODES;
        //源字符长度
        int codesLen = code.length();
        //随机数
        Random randCode = new Random();
        //生成验证码
        for(int i = 0; i < veifiySize; i++){
            verifiyCode.append(code.charAt(randCode.nextInt(codesLen - 1)));
         }
        return verifiyCode.toString();
    }
    //随机颜色-->给定范围
    public static Color getRandColor(int fc,int bc){
        Random randColor = new Random();
        int r = fc+randColor.nextInt(bc - fc);
        int g = fc+randColor.nextInt(bc - fc);
        int b = fc+randColor.nextInt(bc - fc);
        return new Color(r,g,b);
    }
    public static BufferedImage createImage(int w, int h,String veifiyCode){
        /*创建图像类--->参数：宽，高，图像类型
                BufferedImage.TYPE_INT_RGB--->表示一个图像，该图像具有整数像素的 8 位 RGB 颜色*/
        BufferedImage image = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
        //创建画笔-->声明画笔在图像上的（获取图形上下文）
        Graphics2D g2 = image.createGraphics();
        /*开启文字抗锯齿---使文字清晰度更高
                    RenderingHints.KEY_ANTIALIASING --> 抗锯齿提示键。
                    RenderingHints.VALUE_ANTIALIAS_ON --> 抗锯齿提示值——使用抗锯齿模式完成呈现。*/
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(getRandColor(100,160));
        g2.fillRect(0,0,w,h);   //画填充矩形

        //绘制干扰线
        Random random = new Random();
        g2.setColor(getRandColor(10,50));        //设置线条颜色
        for(int i = 0;i < 10;i++){//两个点坐标（x1,y1）,(x2,y2)
            int x1 = random.nextInt(w-1);
            int y1 = random.nextInt(h-1);
            int x2 = random.nextInt(6)+1;
            int y2 = random.nextInt(12)+1;
            g2.drawLine(x1, y1, x1 + x2 + 40, y1 + y2 + 20);
        }

        g2.setColor(getRandColor(10,50));//设置字体颜色
        Font font = new Font("黑体", Font.ITALIC, h); //设置字体参数
        g2.setFont(font);//添加字体

        char[] verifiyCodes =veifiyCode.toCharArray();//将验证码转换成字符数组
        //绘画验证码
        for(int i = 1;i <= veifiyCode.length();i++){
            AffineTransform affine = new AffineTransform();//旋转字体，参数不明白.....
            affine.setToRotation(Math.PI / 4 * random.nextDouble() * (random.nextBoolean() ? 1 : -1),
                                                    (w / 4) * (i-1) + h/2, h/2);
            g2.setTransform(affine);
            g2.drawChars(verifiyCodes,i-1,1,20*i-5, h-4);
        }
        //释放g2资源
        g2.dispose();
        return image;
    }
    //输出图片
    public static void outPutImage(BufferedImage image,String name,OutputStream os) {
        try {
            ImageIO.write(image,name,os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
