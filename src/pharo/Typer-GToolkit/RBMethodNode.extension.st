Extension { #name : #RBMethodNode }

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtShadowMethod [

	| method_ argumentTypes resultType clazz shadow |
	self assert: [ self typGtCanType ].
	method_ := self typInfMethodInSelf.
	argumentTypes := method_ arguments.
	resultType := method_ result.
	clazz := self methodClass.
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

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtTypeWithPragma [

	| context type arguments_ result_ variables_ |
	context := self typInfContextInSelf.
	type := self typInfTypeIn: context.
	arguments_ := self pragmas
		              detect: [ :e | e selector = #typPraArguments: ]
		              ifFound: [ :e | 
			              self removePragma: e.
			              e ]
		              ifNone: [ 
			              self selector isUnary
				              ifTrue: [ #(  ) ]
				              ifFalse: [ 
					              { (RBPragmaNode
						               selector: #typPraArguments:
						               arguments: { (RBLiteralValueNode value:
								                (',' join: (type arguments collect: #asString))) }) } ] ].
	result_ := self pragmas
		           detect: [ :e | e selector = #typPraResult: ]
		           ifFound: [ :e | 
			           self removePragma: e.
			           e ]
		           ifNone: [ 
			           RBPragmaNode
				           selector: #typPraResult:
				           arguments:
				           { (RBLiteralValueNode value: type result asString) } ].
	variables_ := {  }. "typCastAs SequenceableCollection<RBPragmaNode>"
	self selector = #initialize ifTrue: [ 
		variables_ := self methodClass instVarNames collect: [ :e | 
			              self pragmas
				              detect: [ :f | f selector = #typPraVariable:as: ]
				              ifFound: [ :f | 
					              self removePragma: f.
					              f ]
				              ifNone: [ 
					              RBPragmaNode
						              selector: #typPraVariable:as:
						              arguments: { 
								              (RBLiteralValueNode value: e asString).
								              (RBLiteralValueNode value:
									               (context self lookupVariable: e asSymbol)
										               asString) } ] ] ].
	arguments_ do: [ :e | self addPragma: e ].
	self addPragma: result_.
	variables_ do: [ :e | self addPragma: e ]
]
