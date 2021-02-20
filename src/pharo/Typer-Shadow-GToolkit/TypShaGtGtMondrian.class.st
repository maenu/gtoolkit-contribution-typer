Class {
	#name : #TypShaGtGtMondrian,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrian class >> shadowedClass [
	^ GtMondrian class
]

{ #category : #accessing }
TypShaGtGtMondrian >> ___edges [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianEdgeBuilder typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMondrian >> ___layout [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianLayoutBuilder typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMondrian >> ___nodes [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianNodeBuilder typAsType ];
		yourself
]
