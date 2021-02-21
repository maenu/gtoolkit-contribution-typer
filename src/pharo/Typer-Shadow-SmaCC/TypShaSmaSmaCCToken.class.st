Class {
	#name : #TypShaSmaSmaCCToken,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCToken class >> shadowedClass [
	^ SmaCCToken class
]

{ #category : #shadow }
TypShaSmaSmaCCToken >> mStopPosition: aLookup [ 
	<typShaMethod: 'stopPosition'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType asNullable ];
		yourself
]

{ #category : #shadow }
TypShaSmaSmaCCToken >> mValue: aLookup [ 
	<typShaMethod: 'value'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
