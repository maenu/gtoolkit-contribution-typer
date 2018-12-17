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
			| clazz clazzes |
			clazz := a receiverType asClass.
			clazzes := a selector first isUppercase
				ifTrue: [ | definer |
					definer := clazz instanceSide
						whichClassDefinesClassVar: a selector.
					(self withAllSuperclassesOf: clazz instanceSide until: definer)
						flatCollect: [ :e | 
							{e instanceSide.
							e classSide} ] ]
				ifFalse: [ | definer |
					definer := clazz whichClassDefinesInstVar: a selector.
					self withAllSuperclassesOf: clazz until: definer ].
			self
				flag:
					'this might also catch overridden methods, making it not completely sound'.
			(clazzes
				flatCollect: [ :e | 
					e methods
						flatCollect: [ :f | 
							(f assignmentNodes select: [ :g | g variable name = a selector ])
								collect: [ :g | g value typType ] ] ]) typAsType ]
]

{ #category : #accessing }
TypDefaultVariableResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass
]

{ #category : #initialization }
TypDefaultVariableResolver >> withAllSuperclassesOf: aClass until: anotherClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<ClassDescription>'>
	| clazzes |
	clazzes := aClass withAllSuperclasses.
	^ clazzes copyFrom: 1 to: (clazzes indexOf: anotherClass)
]
