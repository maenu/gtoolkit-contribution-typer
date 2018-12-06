Class {
	#name : #TypDefaultVariableResolver,
	#superclass : #TypVariableResolver,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypDefaultVariableResolver >> initialize [
	super initialize.
	self
		type: [ :a | 
			| clazz clazzes types |
			clazz := a receiverType asClass.
			clazzes := a selector first isUppercase
				ifTrue: [ | definer |
					definer := clazz instanceSide whichClassDefinesClassVar: a selector.
					(self withAllSuperclassesOf: clazz instanceSide until: definer)
						flatCollect: [ :e | 
							{e instanceSide.
							e classSide} ] ]
				ifFalse: [ | definer |
					definer := clazz whichClassDefinesInstVar: a selector.
					self withAllSuperclassesOf: clazz until: definer ].
			"this might also catch overridden methods"
			types := clazzes
				flatCollect: [ :e | e methods flatCollect: [ :f | (f assignmentNodes select: [ :g | g variable name = a selector ]) collect: [ :g | g value typType ] ] ].
			(types
				inject: TypUnionType new
				into: [ :f :g | 
					f increment: g.
					f ]) asType ]
]

{ #category : #accessing }
TypDefaultVariableResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass
]

{ #category : #initialization }
TypDefaultVariableResolver >> withAllSuperclassesOf: aClass until: anotherClass [
	| clazzes |
	clazzes := aClass withAllSuperclasses.
	^ clazzes copyFrom: 1 to: (clazzes indexOf: anotherClass)
]
