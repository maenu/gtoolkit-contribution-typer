Extension { #name : #GtPharoSourceCoderViewModel }

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoderViewModel >> typGtContext [
	coderModel attributes
		at: #typGtContextEnabled put: true;
		at: #typGtSubscription
			ifAbsentPut: [ self weak
					when: GtTextualCoderViewModelTextChanged
					send: #typGtOnViewModelTextChanged:
					to: self ];
		at: #typGtContext ifPresent: [ :c | ^ c ].
	self typGtContextPromise.
	^ nil
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoderViewModel >> typGtContextPromise [
	^ coderModel attributes
		at: #typGtContextPromise
			ifPresent: [ :p | 
				(coderModel attributes at: #typGtContextPromiseSourceCode)
					= coderModel sourceCode ifTrue: [ ^ p ].
				p cancelHard ];
		at: #typGtContextPromiseSourceCode put: coderModel sourceCode;
		at: #typGtContextPromise
			put: [ [ coderModel attributes
					at: #typGtContext
					put: self typGtRbAst typInfContext run ]
					ensure: [ coderModel requestStyleSourceText ] ] typAsAsyncFuture typAwait
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoderViewModel >> typGtOnViewModelTextChanged: aTextualCoderViewModelTextChanged [
	coderModel attributes
		at: #typGtContextPromise ifPresent: #cancelHard;
		removeKey: #typGtContext ifAbsent: [  "noop" ];
		removeKey: #typGtContextPromise ifAbsent: [  "noop" ];
		removeKey: #typGtContextPromiseSourceCode ifAbsent: [  "noop" ];
		at: #typGtContextEnabled ifPresent: [ :b | self typGtContextPromise ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoderViewModel >> typGtRbAst [
	^ (coderModel
		parseExpression: coderModel currentSourceString
		requestor: self compositeVariableBindings)
		doSemanticAnalysis;
		yourself
]
