Class {
	#name : #TypShaPhaColor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaColor class >> ___blue [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___green [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___orange [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___purple [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___red [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___veryLightGray [
	^ TypMethodLookupResult new
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
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
