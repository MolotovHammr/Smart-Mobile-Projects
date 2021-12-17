package com.smart.homegarden

import android.graphics.Color
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import com.smart.homegarden.Data.PlantList

class PlantsRecyclerViewAdapter(private val plantsList: PlantList) : RecyclerView.Adapter<PlantsRecyclerViewAdapter.PlantViewHolder>(){

    private lateinit var mListener: onItemClickListener

    interface onItemClickListener{

        fun OnItemClick(position: Int)
    }

    fun setOnItemClickListener(listener: onItemClickListener){

        mListener = listener
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PlantViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.plantcard, parent, false)
        view.setOnClickListener {  }
        return PlantViewHolder(view, mListener)
    }

    override fun onBindViewHolder(holder: PlantViewHolder, position: Int) {
        holder.plantName.text = plantsList.items[position].plantName
        holder.plantCard.setCardBackgroundColor(R.color.Red)
    }

    override fun getItemCount(): Int {
        return plantsList.items.size
    }

    inner class PlantViewHolder(itemView: View, listener: onItemClickListener) : RecyclerView.ViewHolder(itemView) {
        internal val plantName: TextView = itemView.findViewById<View>(R.id.plantName) as TextView
        internal val plantImage: ImageView = itemView.findViewById<View>(R.id.imageView3) as ImageView
        internal val plantCard: CardView = itemView.findViewById(R.id.plantCard)

        init {
            itemView.setOnClickListener {
                listener.OnItemClick(adapterPosition)
            }
        }
    }
}