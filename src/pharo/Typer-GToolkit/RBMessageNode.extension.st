Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtInvokedMethods [

	| methods receiverType |
	methods := super typGtInvokedMethods.
	receiverType := receiver typInfTypeInSelf.
	(receiverType isNamed and: [ receiverType hasClassDescription ]) 
		ifTrue: [ 
			receiverType classDescription
				classAndMethodFor: selector value
				do: [ :c :m | ^ methods , { m } ]
				ifAbsent: [  ] ].
	^ methods
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtShadowMethod [

	| method_ receiverType argumentTypes resultType clazz shadow |
	self assert: [ self typGtCanType ].
	method_ := self typInfMethodInSelf.
	receiverType := self receiver typInfTypeInSelf.
	argumentTypes := method_ arguments.
	resultType := method_ result.
	clazz := (receiverType isNamed and: [ 
		          receiverType hasClassDescription ])
		         ifTrue: [ receiverType classDescription ]
		         ifFalse: [ Object ].
	shadow := (TypShaShadow typGtShadowFor: clazz instanceSide)
		          ifEmpty: [ 
		          TypShaShadow typGtNewShadowFor: clazz instanceSide ]
		          ifNotEmpty: #first.
	^ shadow classSide
		  typGtShadowMethod: selector value
		  result: resultType
		  arguments: argumentTypes
		  in: (clazz isInstanceSide
				   ifTrue: [ shadow ]
				   ifFalse: [ shadow class ])
]
