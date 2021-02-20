Class {
	#name : #TypShaGtGtPharoProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoProgramNode class >> shadowedClass [
	^ GtPharoProgramNode class
]

{ #category : #accessing }
TypShaGtGtPharoProgramNode >> ___actionForSelector: _a startingWith: _b at: _c [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ String typAsType ]
						ifFalse: [ Integer typAsType ] ] ];
		resultType: [ :a :s :r | GtCompletionAction typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoProgramNode >> ___completionActionsFor: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtPharoCompletionStrategy typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {GtCompletionAction typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoProgramNode >> ___source [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
