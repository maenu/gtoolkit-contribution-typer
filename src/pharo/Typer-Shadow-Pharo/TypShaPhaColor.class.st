Class {
	#name : #TypShaPhaColor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaColor class >> ___blue [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___green [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___orange [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___purple [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___red [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___veryLightGray [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaColor class >> shadowedClass [
	^ Color class
]

{ #category : #accessing }
TypShaPhaColor >> ___alpha: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
