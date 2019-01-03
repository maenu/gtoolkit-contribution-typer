Class {
	#name : #TypShaGtGtPhlowProtoView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowProtoView class >> shadowedClass [
	^ GtPhlowProtoView class
]

{ #category : #accessing }
TypShaGtGtPhlowProtoView >> ___explicit [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtPhlowExplicitView typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPhlowProtoView >> ___mondrian [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtPhlowMondrianView typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPhlowProtoView >> ___priority: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPhlowProtoView >> ___title: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
