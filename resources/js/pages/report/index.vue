<template>
	<div>
		<el-tabs type="border-card">
			<el-tab-pane label="របាយការណ៏វត្តមានសិស្ស">
				<div class="bg-white p-2 w-full flex justify-between">

					<div class="flex space-x-2">
						<div class="self-start  ">
							<el-select
								v-model="academicSelectValue"
								filterable
								clearable
								placeholder="ឆ្នាំសិក្សា"
							>
								<el-option
									v-for="item in academic"
									:key="item.filterValue"
									:label="item.filterLabel"
									:value="item.filterValue"
								>
								</el-option>
							</el-select>
						</div>
						<div class="self-start  ">
							<el-select
								v-model="filterSelectValue "
								filterable
								clearable
								placeholder="ថ្នាក់រៀន"
							>
								<el-option
									v-for="item in filter"
									:key="item.filterValue"
									:label="item.filterLabel"
									:value="item.filterValue"
								>
								</el-option>
							</el-select>
						</div>

					</div>
					<div class="self-end">
						<el-button
							type="primary"
							@click="popUpProfile"
						>
							<el-icon>
								<Tools />
							</el-icon>
							<span class="mx-1 sanfont-khmer">TEST PROFILE</span>
						</el-button>
						<el-button
							type="primary"
							@click=""
						>
							<el-icon>
								<Tools />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍</span>
						</el-button>
					</div>
				</div>
				<el-table
					v-loading="loading_schedule"
					:data="studentObj"
					resizable="false"
					height="690"
					header-cell-class-name="sanfont-khmer text-md"
					row-class-name="sanfont-khmer"
					style="width: 100%"
					stripe
					border
				>
					<el-table-column
						label="ID"
						type="index"
						fixed
					></el-table-column>
					<el-table-column
						fixed
						label="ឈ្មោះសិស្ស"
						min-width="250"
					>
						<template #default="scope">
							<div>
								<span>{{ scope.row.student_in_class.first_name_kh }} {{ scope.row.student_in_class.last_name_kh }}</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed
						label="ថ្ងៃខែឆ្នាំកំណើត"
						min-width="200"
					>
						<template #default="scope">
							<span>
								{{ scope.row.student_in_class.date_of_birth }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						fixed
						label="ស្ថានភាព"
						width="150"
					>
						<template #default="scope">
							<span :style="'color:'+scope.row.student_in_class.status.color">
								{{ scope.row.student_in_class.status.status_kh }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						v-for="data in attendanceObj"
						:key="data.attendance_id"
						width="100"
						align="center"
					>
						<template #header>
							{{ formatDate(data.created_at)}}
						</template>
						<template #default="scope">
							<span :class="geColor(scope.row['attendance_'+data.attendance_id])">
								{{ scope.row['attendance_'+data.attendance_id]}}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						fixed="right"
						label="សរុប"
						align="center"
						min-width="200"
					>

						<el-table-column
							prop="state"
							label="PS"
							value="10"
							width="50"
							class="text-green-600"
						>
							<template #default="scope">
								<span class="text-green-600">
									12
								</span>
							</template>
						</el-table-column>
						<el-table-column
							prop="city"
							label="PM"
							value="0"
							width="50"
							class="text-yellow-600"
						>
							<template #default="scope">
								<span class="text-yellow-600">
									12
								</span>
							</template>
						</el-table-column>
						<el-table-column
							prop="address"
							label="AL"
							value="5"
							width="50"
							class="text-blue-600"
						>
							<template #default="scope">
								<span class="text-blue-600">
									12
								</span>
							</template>
						</el-table-column>
						<el-table-column
							prop="address"
							label="A"
							value="10"
							width="50"
							class="text-red-600"
						>
							<template #default="scope">
								<span class="text-red-600">
									12
								</span>
							</template>
						</el-table-column>

						<!-- <template #default="scope">
							<div class="flex space-x-4 ">
								<span class="text-green-600">( 2 ) PS</span>
								<span class="text-yellow-600">( 0 ) P</span>
								<span class="text-blue-600">( 0 ) AL</span>
								<span class="text-red-600">( 2 ) A</span>
							</div>
						</template> -->
					</el-table-column>
				</el-table>
				

			</el-tab-pane>
			<el-tab-pane label="របាយការណ៏ពិន្ទុសិស្ស">
				<div class="bg-white p-2 w-full flex justify-between">

					<div class="flex space-x-2">
						<div class="self-start  ">
							<el-select
								v-model="academicSelectValue"
								filterable
								clearable
								placeholder="ឆ្នាំសិក្សា"
							>
								<el-option
									v-for="item in academic"
									:key="item.filterValue"
									:label="item.filterLabel"
									:value="item.filterValue"
								>
								</el-option>
							</el-select>
						</div>
						<div class="self-start  ">
							<el-select
								v-model="filterSelectValue "
								filterable
								clearable
								placeholder="ថ្នាក់រៀន"
							>
								<el-option
									v-for="item in filter"
									:key="item.filterValue"
									:label="item.filterLabel"
									:value="item.filterValue"
								>
								</el-option>
							</el-select>
						</div>
						<div class="self-start  ">
							<el-select
								v-model="filterSelectValue "
								filterable
								clearable
								placeholder="ប្រភេទពិន្ទុ"
							>
								<el-option
									v-for="item in filter"
									:key="item.filterValue"
									:label="item.filterLabel"
									:value="item.filterValue"
								>
								</el-option>
							</el-select>
						</div>

					</div>
					<div class="self-end">
						<el-button type="primary">
							<el-icon>
								<Tools />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> ដំណើរការទាញរបាយការណ៍</span>
						</el-button>
					</div>
				</div>
				<el-table
					v-loading="loading_schedule"
					:data="studentObj"
					height="690"
					resizable="false"
					header-cell-class-name="sanfont-khmer text-md"
					row-class-name="sanfont-khmer"
					style="width: 100%"
					stripe
					border
				>
					<el-table-column
						label="ID"
						type="index"
						fixed
					></el-table-column>
					<el-table-column
						fixed
						label="ឈ្មោះសិស្ស"
						min-width="250"
					>
						<template #default="scope">
							<div>
								<span>{{ scope.row.student_in_class.first_name_kh }} {{ scope.row.student_in_class.last_name_kh }}</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed
						label="ថ្ងៃខែឆ្នាំកំណើត"
						min-width="200"
					>
						<template #default="scope">
							<span>
								{{ scope.row.student_in_class.date_of_birth }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						fixed
						label="ស្ថានភាព"
						width="150"
					>
						<template #default="scope">
							<span :style="'color:'+scope.row.student_in_class.status.color">
								{{ scope.row.student_in_class.status.status_kh }}
							</span>
						</template>
					</el-table-column>
					<el-table-column
						v-for="data in attendanceObj"
						:key="data.attendance_id"
						width="100"
						align="center"
					>
						<template #header>
							{{ formatDate(data.created_at)}}
						</template>
						<template #default="scope">
							<span :class="geColor(scope.row['attendance_'+data.attendance_id])">
								{{ scope.row['attendance_'+data.attendance_id]}}
							</span>
						</template>
					</el-table-column>
					<!-- <el-table-column
					fixed="right"
					label="ប្រចាំខែ មករា"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="flex space-x-4 ">
							<el-input
								v-model="scope.row.mark"
								placeholder="0.00"
							/>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="ប្រចាំខែ​ កុម្ភះ"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="flex space-x-4 ">
							<el-input
								v-model="scope.row.mark"
								placeholder="0.00"
							/>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="ប្រចាំខែ មីនា"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="flex space-x-4 ">
							<el-input
								v-model="scope.row.mark"
								placeholder="0.00"
							/>
						</div>
					</template>
				</el-table-column>
				<el-table-column
					fixed="right"
					label="ប្រចាំខែ​ មេសា​"
					align="center"
					min-width="100"
				>
					<template #default="scope">
						<div class="flex space-x-4 ">
							<el-input
								v-model="scope.row.mark"
								placeholder="0.00"
							/>
						</div>
					</template>
				</el-table-column> -->
					<el-table-column
						fixed="right"
						label="ពិន្ទុសរុប"
						align="center"
						width="100"
					>
						<template #default="scope">
							<div class="text-center items-center w-full">
								<span>{{ 545- scope.row.student_id }}.00</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed="right"
						label="មធ្យមភាគ"
						align="center"
						min-width="100"
					>
						<template #default="scope">
							<div class=" text-center items-center">
								<span>{{ 45- scope.row.student_id }}.00</span>
							</div>
						</template>
					</el-table-column>
					<el-table-column
						fixed="right"
						label="ចំណាត់ថ្នាក់"
						align="center"
						min-width="100"
					>
						<template #default="scope">
							<div class="text-center items-center">
								<span>{{  scope.row.student_id  }}st</span>
							</div>
						</template>
					</el-table-column>
				</el-table>

			</el-tab-pane>
		</el-tabs>
	</div>

	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ប្រវត្តិរូប"
		class="sanfont-khmer"
		width="35%"
		
	>
		<el-form
			class="grid grid-cols-2 "
			id="fm"
		>	
			
			<div class="flex flex-col">
				<el-form-item
					label="ឈ្មោះ"
					prop="name"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
					
				>
					<span >សោភា សុីវមុី</span>
				</el-form-item>
				<el-form-item
					label="លេខទូរស័ព្ទ"
					prop="phone"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
				<span >011 999222</span>	
				</el-form-item>
				<el-form-item
					label="សារអេឡិចត្រូនិច"
					prop="email"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
				<span >www.sievmey@gmail.com</span>
				</el-form-item>
				
				<el-form-item
					label="តួនាទី"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
				<div class="flex space-x-2">
				<el-tag type="info">super-admin</el-tag>
				<el-tag type="info">role-editor</el-tag>
				</div>
				</el-form-item>
			</div>
			<div class="flex justify-center">
			<el-form-item
				class="sanfont-khmer"
				
			>
			<img
				src="../../assets/teacher1.jpg"
				class="w-[150px]"
			/>
			</el-form-item>
			</div>
		
			
		
		</el-form>
		
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelAction()"
					class="sanfont-khmer"
					type="danger"
				> បោះបង់</el-button>
				
			</span>
		</template>
	
	</el-dialog>
	<!-- Dialog user  -->

</template>
<script>
export default {
	data() {
		return {
			dialogFormVisible: false,
			formLabelWidth: "150px",

			ruleForm: {
			},

			filter: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'ទី១០ A'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'ទី១១ A'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'ទី១២ A'
			}],
			academic: [{
				filterValue: 'តាមឈ្មោះ',
				filterLabel: 'ឆ្នាំ២០២១-២០២២'
			}, {
				filterValue: 'តាមលេខរៀង',
				filterLabel: 'ឆ្នាំ២០២២-២០២៣'
			}, {
				filterValue: 'តាមកាលបរិច្ឆេត',
				filterLabel: 'ឆ្នាំ២០២៣-២០២៤'
			}
			],
			filterSelectValue: "",
			academicSelectValue: "",
		}
	},
	methods: {

		async popUpProfile() {
			this.dialogFormVisible = true
			
		},

	}
}
</script>