<template>
	<!-- <div class="mt-5 bg-white p-5"> -->
		<div>
		<div class="text-left text-[20px] font-bold pb-2 ">បញ្ជីឈ្មោះសិស្ស</div>
		</div>
		<div class="bg-white p-2 w-full flex justify-between">
		<div class="flex space-x-2">
		<div class="self-start">
			<el-input
				placeholder="ស្វែងរក"
				class="sanfont-khmer"
				v-model="search"
			>
				<i class="el-input__icon el-icon-search"></i>
				<CirclePlusFilled class="el-input__icon" />
			</el-input>
		</div> 
		<div class="self-start  " >
			<el-select v-model="filterSelectValue" filterable placeholder="តម្រៀប">
    		<el-option
    		  	v-for="item in filter"
      			:key="item.filterValue"
      			:label="item.filterLabel"
      			:value="item.filterValue">
    		</el-option>
  			</el-select>
		</div>
		</div>
		
		<div class="self-end">

			<el-button
				type="primary"
				@click="AddUser"
			>
				<el-icon>
					<CirclePlusFilled />
				</el-icon>
				<span class="mx-1 sanfont-khmer"> បន្ថែមសិស្ស</span>
			</el-button>
		</div>
	</div>	
	
	<el-table
		:data="data"
		header-cell-class-name="sanfont-khmer text-md"
		row-class-name="sanfont-khmer"
		stripe
	>
		<el-table-column
			label="ID"
			type="index"
		></el-table-column>
		<el-table-column label="ឈ្មោះសិស្ស">
			<template #default="scope">
				<span>
					{{ scope.row.student_in_class.first_name_kh }} {{ scope.row.student_in_class.last_name_kh }}
				</span>
			</template>
		</el-table-column>
		<el-table-column label="ថ្ងៃខែឆ្នាំកំណើត">
			<template #default="scope">
				<span>
					01-06-2020
				</span>
			</template>
		</el-table-column>
		<el-table-column label="ស្ថានភាព">
			<template #default="scope">
				<span class="text-blue-500">
					កំពុងសិក្សា
				</span>
			</template>
		</el-table-column>
	</el-table>
	<!-- </div> -->
</template>
<script>
export default {
	
	props: {
		data: Object
	},
	created() {
		this.studentClass = this.$props.data
	},
	data() {
		return {
			studentClass: [],

			filter: [{
					filterValue: 'តាមឈ្មោះ',
        			filterLabel: 'តាមឈ្មោះ'
       				 }, {
					filterValue: 'តាមលេខរៀង',
        			filterLabel: 'តាមលេខរៀង'
       				 },{
					filterValue: 'តាមកាលបរិច្ឆេត',
        			filterLabel: 'តាមកាលបរិច្ឆេត'
       				 }, {
					filterValue: 'តាមទំហំផ្ទុក',
					filterLabel: 'តាមទំហំផ្ទុក'
        	}],
			filterSelectValue: "",
		}
	},
	
	methods: {
		
	}
}
</script>