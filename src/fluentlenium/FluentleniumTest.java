package fluentlenium;

import org.fluentlenium.adapter.FluentTest;
import org.junit.Test;

public class FluentleniumTest extends FluentTest  {

    @Test
    public void test() {
        goTo("http://www.yahoo.co.jp/");
        fill("#srchtxt").with("テスト　Fluentlenium　使い方");
        click("#srchbtn");
    }
}
