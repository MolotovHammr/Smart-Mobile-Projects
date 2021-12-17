package com.smart.homegarden.ViewModels

import android.content.Context
import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.smart.homegarden.Data.Plant
import com.smart.homegarden.Data.PlantList
import java.io.FileInputStream

class MainActivityViewModel: ViewModel() {
    private var plantsList: PlantList = PlantList(ArrayList())
    private var plantsListLiveData: MutableLiveData<PlantList> = MutableLiveData()

    fun observerPlantsList(): MutableLiveData<PlantList> {
        return plantsListLiveData
    }

    fun addPlantToList(newPlant: Plant){
        plantsList.items.add(newPlant)
        plantsListLiveData.value = plantsList
    }

    fun getPlantsDataFromStorage(context: Context){

        val gson = Gson()
        context.openFileInput("plantsListData.json").use { stream ->
            val storedPlantListString = stream.bufferedReader().use {
                it.readText()
            }
            plantsList = gson.fromJson(storedPlantListString, PlantList::class.java)
            plantsListLiveData.value = plantsList
        }
    }


    fun writePlantsDataToStorage(context: Context){

        val gson = GsonBuilder().setPrettyPrinting().create()
        val plantsListJSON: String = gson.toJson(plantsList)
        val fileName = "plantsListData.json"

        context.openFileOutput(fileName, Context.MODE_PRIVATE).use {
            it.write(plantsListJSON.toByteArray())
        }
    }
}