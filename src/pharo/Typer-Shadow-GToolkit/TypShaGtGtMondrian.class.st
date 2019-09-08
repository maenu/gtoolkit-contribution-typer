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
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianEdgeBuilder typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMondrian >> ___layout [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianLayoutBuilder typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMondrian >> ___nodes [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtMondrianNodeBuilder typAsType ];
		yourself
]
