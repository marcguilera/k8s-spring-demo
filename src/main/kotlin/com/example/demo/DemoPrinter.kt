package com.example.demo

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component

@Component
open class DemoPrinter {
    @Autowired
    private lateinit var props: DemoProperties
    private val logger = LoggerFactory.getLogger(DemoPrinter::class.java)

    @Scheduled(fixedDelay = 5000)
    fun print() {
        logger.info("The name is: ${props.name}")
    }
}