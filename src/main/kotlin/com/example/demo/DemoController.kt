package com.example.demo

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.cloud.context.config.annotation.RefreshScope
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RefreshScope
@RestController
class DemoController {

    // This bean is refreshed when K8s changes the config map :)
    @Autowired
    private lateinit var props: DemoProperties;

    @RequestMapping("/hello")
    fun hello(): String {
        return "{\"username\":\"${props.name}\"}"
    }

}