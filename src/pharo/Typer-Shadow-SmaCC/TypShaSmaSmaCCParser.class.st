Class {
	#name : #TypShaSmaSmaCCParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #accessing }
TypShaSmaSmaCCParser class >> ___parse: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCParser class >> shadowedClass [
	^ SmaCCParser class
]
