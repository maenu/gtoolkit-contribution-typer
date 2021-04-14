Class {
	#name : #TypShaGtGtNoStorageStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtNoStorageStrategy class >> mUniqueInstance: aLookup [
	<typShaMethod: 'uniqueInstance'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
]

{ #category : #'as yet unclassified' }
TypShaGtGtNoStorageStrategy class >> shadowedClass [
	^ GtNoStorageStrategy class
]
