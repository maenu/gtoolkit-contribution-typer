Class {
	#name : #TypShaBrBrTextEditor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditor class >> shadowedClass [
	^ BrTextEditor class
]

{ #category : #accessing }
TypShaBrBrTextEditor >> ___invalidate: _a to: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrTextEditor >> ___text [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlText typAsType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrTextEditor >> ___update: _a to: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
