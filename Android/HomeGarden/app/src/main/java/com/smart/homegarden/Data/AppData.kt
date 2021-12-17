package com.smart.homegarden.Data

import java.io.Serializable

data class PlantList(val items: ArrayList<Plant>)
data class Plant(var id: Int, var plantName: String, var plantImage: String, var color: String, var waterAmount: Int, var wateringFrequency: Int ): Serializable