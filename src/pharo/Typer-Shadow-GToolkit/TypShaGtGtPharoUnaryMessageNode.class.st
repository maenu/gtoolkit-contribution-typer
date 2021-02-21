Class {
	#name : #TypShaGtGtPharoUnaryMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoUnaryMessageNode class >> shadowedClass [
	^ GtPharoUnaryMessageNode class
]

{ #category : #shadow }
TypShaGtGtPharoUnaryMessageNode >> mParent: aLookup [ 
	<typShaMethod: 'parent'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtPharoMessageSendNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPharoUnaryMessageNode >> mSelectorPart: aLookup [ 
	<typShaMethod: 'selectorPart'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SmaCCToken typAsType ];
		yourself
]
