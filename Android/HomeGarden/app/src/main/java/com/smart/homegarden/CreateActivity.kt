package com.smart.homegarden

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.activity.result.contract.ActivityResultContracts
import com.smart.homegarden.Data.Plant
import com.smart.homegarden.databinding.ActivityCreateBinding
import kotlin.random.Random

class CreateActivity : AppCompatActivity() {

    private lateinit var binding: ActivityCreateBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityCreateBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //Get Name from activity creator
        val plantName: String? = intent.getStringExtra("plantName")
        binding.plantNameCreate.text = plantName
        
        createColourSpinner()
        proceedToStepTwo(plantName!!)
    }

    private var launchCreateStepTwoActivity = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val data: Intent? = result.data
            val newPlant: Plant = data!!.getSerializableExtra("newPlant") as Plant

            intent.putExtra("newPlant", newPlant)
            setResult(Activity.RESULT_OK, intent)
            finish()
        }
    }

    private fun proceedToStepTwo(plantName: String) {
        binding.proceedToStepTwo.setOnClickListener {

            Intent(this@CreateActivity, CreateStepTwoActivity::class.java).also {

                it.putExtra("plantName", plantName)
                it.putExtra("plantColour", binding.colourSpinner.selectedItem.toString())
                launchCreateStepTwoActivity.launch(it)
            }
        }
    }

    private fun createColourSpinner(){
        binding.colourSpinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener{
            override fun onItemSelected(
                spinner: AdapterView<*>?,
                view: View?,
                position: Int,
                id: Long
            ) {
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
            }
        }
    }


}