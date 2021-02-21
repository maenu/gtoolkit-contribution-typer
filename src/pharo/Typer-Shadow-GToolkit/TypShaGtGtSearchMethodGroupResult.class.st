Class {
	#name : #TypShaGtGtSearchMethodGroupResult,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtSearchMethodGroupResult class >> mForFilter: aLookup [ 
	<typShaMethod: 'forFilter:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtSearchMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchMethodGroupResult class >> shadowedClass [
	^ GtSearchMethodGroupResult class
]

{ #category : #converting }
TypShaGtGtSearchMethodGroupResult >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters: {('@A' -> CompiledMethod typAsType)} asOrderedDictionary
]
