Class {
	#name : #TypShaGtGtMondrianNodeBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrianNodeBuilder class >> shadowedClass [
	^ GtMondrianNodeBuilder class
]

{ #category : #accessing }
TypShaGtGtMondrianNodeBuilder >> ___with: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType:
				[ :a :s :r | (a argumentTypes at: 1) asParametricType: {BlElement typAsType} ];
		yourself
]
