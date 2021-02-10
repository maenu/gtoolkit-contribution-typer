Class {
	#name : #TypShaGtGtSearchMethodGroupResult,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtSearchMethodGroupResult class >> ___forFilter: _a [
	^ TypMethodLookupResult new
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
