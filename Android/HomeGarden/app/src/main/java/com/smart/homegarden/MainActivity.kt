package com.smart.homegarden

import android.app.Activity
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Build.VERSION_CODES.O
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatDelegate
import androidx.core.app.NotificationCompat
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.smart.homegarden.Data.Plant
import com.smart.homegarden.Data.PlantList
import com.smart.homegarden.ViewModels.MainActivityViewModel
import com.smart.homegarden.databinding.ActivityMainBinding
import kotlin.random.Random

class MainActivity : AppCompatActivity() {

    val CHANNEL_ID = "channelID"
    val CHANNEL_NAME = "channelName"

    private lateinit var binding: ActivityMainBinding
    private lateinit var viewModel: MainActivityViewModel
    private var plantRecyclerViewAdapter: RecyclerView.Adapter<PlantsRecyclerViewAdapter.PlantViewHolder>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        //Create the MainActivity
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        viewModel = ViewModelProvider(this).get(MainActivityViewModel::class.java)
        viewModel.writePlantsDataToStorage(application)
        viewModel.getPlantsDataFromStorage(application)
        createNotificationChannel()

        val notification = NotificationCompat.Builder(this, CHANNEL_ID).setContentTitle("Test").setContentTitle("Hello World").setSmallIcon(R.drawable.ic_launcher_foreground)

        supportActionBar?.elevation = 0F;

        //Initialize the PlantRecyclerView
        createPlantRecyclerView(viewModel.observerPlantsList().value!!)

        binding.createPlantButton.setOnClickListener {

            Intent(this@MainActivity, CreateActivity::class.java).also {
               val plantNameStringArray: Array<String> = resources.getStringArray(R.array.plantNames)
                val randomIndex = Random.nextInt(plantNameStringArray.size)
                it.putExtra("plantName", plantNameStringArray[randomIndex])
                launchCreateActivity.launch(it)
            }
        }
        AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO)
    }

    fun createNotificationChannel(){
        if(Build.VERSION.SDK_INT >= O){
            val channel = NotificationChannel(CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_DEFAULT).apply {

            }
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }

    private var launchCreateActivity = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val data: Intent? = result.data
            viewModel.addPlantToList(data!!.getSerializableExtra("newPlant") as Plant)
        }
    }

    override fun onRestart() {
        super.onRestart()
        viewModel.observerPlantsList().observe(this, {
            createPlantRecyclerView(it)
        })
    }

    private fun createPlantRecyclerView(plantList: PlantList){

        //Create RecyclerView using PlantsRecyclerViewAdapter
        val mLayoutManager = LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)
        binding.plantCardRecyclerView.layoutManager = mLayoutManager
        plantRecyclerViewAdapter = PlantsRecyclerViewAdapter(plantList)
        binding.plantCardRecyclerView.adapter = plantRecyclerViewAdapter

        //Create OnClickListener for each item
        (plantRecyclerViewAdapter as PlantsRecyclerViewAdapter).setOnItemClickListener(object: PlantsRecyclerViewAdapter.onItemClickListener{
            override fun OnItemClick(position: Int) {

                val selectedPlant: Plant = viewModel.observerPlantsList().value!!.items[position]

                Intent(this@MainActivity, PlantActivity::class.java).also {
                    it.putExtra("PLANT", selectedPlant)
                    startActivity(it)
                }
            }
        })
    }

    override fun onStop() {
        super.onStop()
        viewModel.writePlantsDataToStorage(applicationContext)
    }
}