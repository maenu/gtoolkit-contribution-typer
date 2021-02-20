Class {
	#name : #TypShaSmaSmaCCToken,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCToken class >> shadowedClass [
	^ SmaCCToken class
]

{ #category : #accessing }
TypShaSmaSmaCCToken >> ___stopPosition [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType asNullable ];
		yourself
]

{ #category : #accessing }
TypShaSmaSmaCCToken >> ___value [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
