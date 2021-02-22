Class {
	#name : #TypShaBlBlLayoutConstraints,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlLayoutConstraints class >> shadowedClass [
	^ BlLayoutConstraints class
]

{ #category : #shadow }
TypShaBlBlLayoutConstraints >> mHorizontal: aLookup [
	<typShaMethod: 'horizontal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlLayoutConstraints >> mVertical: aLookup [
	<typShaMethod: 'vertical'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
