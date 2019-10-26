<%-- Document : temp Created on : Oct 7, 2019, 5:15:50 PM Author : saru --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <style>
      body,
      html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-weight: 300;
        color: #282c3f;
      }
      *,
      :after,
      :before {
        box-sizing: inherit;
      }
      body {
        display: block;
        margin: 8px;
      }
      body {
        margin: 0;
      }
      .fonts-loaded {
        font-family: ProximaNova, Arial, Helvetica Neue, sans-serif;
        letter-spacing: 0;
      }
      html {
        box-sizing: border-box;
        font-family: Arial, Helvetica Neue, sans-serif;
        font-size: 14px;
        line-height: 1.2;
        letter-spacing: -0.5px;
        -moz-font-smoothing: antialiased;
        -webkit-font-smoothing: antialiased;
      }
      html {
        line-height: 1.15;
        -ms-text-size-adjust: 100%;
        -webkit-text-size-adjust: 100%;
      }
      *,
      :after,
      :before {
        box-sizing: inherit;
      }
      *,
      :after,
      :before {
        box-sizing: inherit;
      }
      div {
        display: block;
      }
      *,
      :after,
      :before {
        box-sizing: inherit;
      }
      ._3arMG {
        position: relative;
        padding-top: 80px;
        min-height: 100%;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-direction: column;
        flex-direction: column;
        min-width: 1240px;
      }
      *,
      :after,
      :before {
        box-sizing: inherit;
      }
      .nDVxx {
        -ms-flex-positive: 1;
        flex-grow: 1;
      }
      ._1w2w1,
      ._2BkKe {
        position: relative;
      }
      ._1w2w1 {
        padding: 0 20px;
        background: #37718e;
        min-height: 100vh;
      }
      ._3tDvm {
        box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.15);
        width: 1300px;
        margin: 0 auto;
        position: relative;
      }
      ._3tDvm,
      .v6luz {
        background: #fff;
        contain: layout;
      }
      .v6luz {
        width: calc(((100vw - 1300px) / 2) + 2px);
        height: 100%;
        position: absolute;
        top: 0;
        left: 1px;
        opacity: 0;
        z-index: 1;
        will-change: opacity;
        transition: opacity 0.3s ease;
        -ms-transform: translateX(-100%);
        transform: translateX(-100%);
      }
      ._3tDvm,
      .v6luz {
        background: #fff;
        contain: layout;
      }
      ._1a4Mf {
        width: calc(((100vw - 1300px) / 2) - 8px);
        height: 100%;
        position: absolute;
        top: 0;
        right: 0;
        background: #37718d;
        opacity: 0;
        z-index: 1;
        transition: opacity 0.3s ease;
        will-change: transform;
        contain: layout;
        -ms-transform: translateX(100%);
        transform: translateX(100%);
      }
      ._3glSS {
        padding-top: 50px !important;
        padding-bottom: 50px !important;
      }
      ._2QhOV {
        max-width: 1200px;
        min-width: 1200px;
        position: relative;
        margin: 0 auto;
        padding-top: 40px;
        padding-bottom: 40px;
        contain: layout;
      }
      ._3R9IF {
        display: -ms-flexbox;
        display: flex;
      }
      ._1stFr {
        -ms-flex: 1;
        flex: 1;
        background: #fff;
        padding: 37px 0 0 50px;
        position: relative;
        min-height: 80vh;
      }
      ._3lCtm {
        font-size: 24px;
        font-weight: 600;
      }
      ._3xMk0 {
        border: 1px solid #d4d5d9;
        padding: 30px;
        margin: 24px 0 37px;
      }
      .g28rk {
        padding-bottom: 20px;
        background-image: linear-gradient(
          90deg,
          #a9abb2 25%,
          hsla(0, 0%, 100%, 0) 0
        );
        background-position: bottom;
        background-size: 4px 1px;
        background-repeat: repeat-x;
        display: -ms-flexbox;
        display: flex;
      }
      ._359Fc {
        background: rgba(40, 44, 63, 0.05);
        width: 150px;
        height: 100px;
        cursor: pointer;
      }
      ._359Fc img {
        height: 100px;
        max-width: 100%;
      }
      ._12_oN {
        opacity: 0;
        transition: opacity 0.3s ease-out;
      }
      ._2tuBw {
        opacity: 1 !important;
      }
      img {
        border-style: none;
      }
      img[Attributes Style] {
        height: 200px;
        width: 300px;
      }
      ._2XWVq {
        -ms-flex: 1;
        flex: 1;
        position: relative;
        padding-left: 18px;
      }
      ._3h4gz {
        font-size: 17px;
        font-weight: 500;
        color: #3d4152;
        display: inline-block;
        cursor: pointer;
      }
      ._2haEe {
        font-size: 13px;
        color: #686b78;
        text-transform: capitalize;
        margin-top: 3px;
      }
      ._2uT6l {
        margin-top: 6px;
        color: #7e808c;
        font-size: 12px;
      }
      ._1ziWV {
        margin-top: 14px;
        color: #fc8019;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        letter-spacing: -0.3px;
        display: inline-block;
      }
      ._2fkm7 {
        float: right;
        position: absolute;
        top: 0;
        right: 0;
        padding-left: 18px;
        font-size: 14px;
        color: #686b78;
      }
      .h-Ntp {
        background: #60b246;
        color: #fff;
        padding: 5px;
        font-size: 10px;
        margin-left: 10px;
        border-radius: 50%;
      }
      [class*=" icon-"],
      [class^="icon-"] {
        font-family: icomoon;
        speak: none;
        font-style: normal;
        font-weight: 400;
        font-variant: normal;
        text-transform: none;
        line-height: 1;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      ._3SKK0 {
        padding-top: 20px;
        position: relative;
      }
      .nRCg_ {
        font-size: 15px;
        padding-right: 240px;
        color: #282c3f;
        line-height: 20px;
      }
      ._2a27y {
        display: -ms-flexbox;
        display: flex;
      }
      .f4Ovn {
        background: #fc8019;
        color: #fff;
      }
      ._3PUy8 {
        width: 120px;
        display: inline-block;
        text-align: center;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        margin-right: 20px;
        line-height: 40px;
        height: 40px;
        color: #fc8019;
        border: 1px solid #fc8019;
        padding: 0 15px;
        margin-top: 20px;
        position: relative;
      }
      a,
      a:focus,
      a:hover,
      a:visited {
        text-decoration: none;
      }
      a {
        background-color: transparent;
        -webkit-text-decoration-skip: objects;
      }
      ._3PUy8 {
        width: 120px;
        display: inline-block;
        text-align: center;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        margin-right: 20px;
        line-height: 40px;
        height: 40px;
        color: #fc8019;
        border: 1px solid #fc8019;
        padding: 0 15px;
        margin-top: 20px;
        position: relative;
      }
      a,
      a:focus,
      a:hover,
      a:visited {
        text-decoration: none;
      }
      a {
        background-color: transparent;
        -webkit-text-decoration-skip: objects;
      }
      ._23DHc {
        float: right;
        position: absolute;
        top: 22px;
        right: 0;
        color: #535665;
        font-size: 14px;
      }
      ._23DHc {
        float: right;
        position: absolute;
        top: 22px;
        right: 0;
        color: #535665;
        font-size: 14px;
      }
      ._1a4Mf {
        width: calc(((100vw - 1300px) / 2) - 8px);
        height: 100%;
        position: absolute;
        top: 0;
        right: 0;
        background: #37718d;
        opacity: 0;
        z-index: 1;
        transition: opacity 0.3s ease;
        will-change: transform;
        contain: layout;
        -ms-transform: translateX(100%);
        transform: translateX(100%);
      }
      ._3m2h5 {
        opacity: 1;
      }
    </style>
  </head>
  <body class>
    <div id="root" style="height: 100%;">
      <div class="_3arMG">
        <div class="nDVxx">
          <div class="_1w2w1">
            <div class="_3tDvm ">
              <div class="v6luz FvIBT"></div>
              <div class="_2QhOV _3glSS">
                <div class="_3R9IF">
                  <div class="_1stFr">
                    <div>
                      <div>
                        <div class="_3lCtm">Past Orders</div>
                        <div>
                          <div class="_3xMk0">
                            <div class="g28rk">
                              <div class="_359Fc">
                                <img
                                  class="_2tuBw _12_oN"
                                  height="200"
                                  width="300"
                                  alt=""
                                  src="https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_300,h_200,c_fill/nfhodclt3lqqr85bemdc"
                                />
                              </div>
                              <div class="_2XWVq">
                                <div class="_3h4gz">Pizza cafe day</div>
                                <div class="_2haEe">Golghar Golghar</div>
                                <div class="_2uT6l">
                                  ORDER #46710162744 | Sat, Jul 20, 08:32 PM
                                </div>
                                <div class="_1ziWV">VIEW DETAILS</div>
                                <div class="_2fkm7">
                                  <span
                                    >Delivered on Sat, Jul 20, 09:03 PM<span
                                      class="h-Ntp icon-tickSharp"
                                    ></span
                                  ></span>
                                </div>
                              </div>
                            </div>
                            <div class="_3SKK0">
                              <div class="nRCg_">
                                7" Onion Veg Single Pizza x 1
                              </div>
                              <div class="_2a27y">
                                <a class="_3PUy8 f4Ovn">REORDER</a
                                ><a class="_3PUy8">HELP</a>
                              </div>
                              <div class="_23DHc">
                                Total Paid: <span class="_3Hghg"> 64 </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="_1a4Mf _3m2h5"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
