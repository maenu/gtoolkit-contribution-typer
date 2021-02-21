Class {
	#name : #TypShaGtGtPhlowObjectEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowObjectEvent class >> shadowedClass [
	^ GtPhlowObjectEvent class
]

{ #category : #shadow }
TypShaGtGtPhlowObjectEvent >> mObject: aLookup [ 
	<typShaMethod: 'object:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Object typAsType asNullable ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPhlowObjectEvent >> mSourceElement: aLookup [ 
	<typShaMethod: 'sourceElement:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlElement typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
