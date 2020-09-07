package com.sorting.algorithm.code;

public class SortingAlgorithm {

	/**
	 * 冒泡排序
	 * 
	 * @param array
	 * @return
	 */
	public static int[] bubbleSort(int[] array) {
		if (array.length == 0) {
			return array;
		}
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array.length - 1 - i; j++) {
				if (array[j + 1] < array[j]) {
					int temp = array[j + 1];
					array[j + 1] = array[j];
					array[j] = temp;
				}
			}
		}
		return array;
	}

	/**
	 * 选择排序
	 * 
	 * @param array
	 * @return
	 */
	public static int[] selectionSort(int[] array) {
		if (array.length == 0)
			return array;
		for (int i = 0; i < array.length; i++) {
			int minIndex = i;
			for (int j = i; j < array.length; j++) {
				// 找到最小的数
				if (array[j] < array[minIndex])
					// 将最小数的索引保存
					minIndex = j;
			}
			int temp = array[minIndex];
			array[minIndex] = array[i];
			array[i] = temp;
		}
		return array;
	}

	/**
	 * 插入排序
	 * 
	 * @param array
	 * @return
	 */
	public static int[] insertionSort(int[] array) {
		if (array.length == 0)
			return array;
		int current;
		for (int i = 0; i < array.length - 1; i++) {
			current = array[i + 1];
			int preIndex = i;
			while (preIndex >= 0 && current < array[preIndex]) {
				array[preIndex + 1] = array[preIndex];
				preIndex--;
			}
			array[preIndex + 1] = current;
		}
		return array;
	}
}
