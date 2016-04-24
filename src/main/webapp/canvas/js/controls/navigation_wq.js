DrawingBoard.Control.Navigation = DrawingBoard.Control.extend({

	name: 'navigation',

	defaults: {
		back: true,
		forward: true,
		reset: true
	},

	initialize: function() {
		/*var el = '';
		if (this.opts.back) el += '<button class="drawing-board-control-navigation-back">&larr;</button>';
		if (this.opts.forward) el += '<button class="drawing-board-control-navigation-forward">&rarr;</button>';
		if (this.opts.reset) el += '<button class="drawing-board-control-navigation-reset">清除</button>';
		this.opts.save = true;
		if (this.opts.save) el += '<button class="drawing-board-control-navigation-save">发送</button>';
		this.$el.append(el);*/


		 if (this.opts.back){
			 this.$el.find('.revert').addClass("drawing-board-control-navigation-back");
		 }
		 if (this.opts.forward){
			 this.$el.find('.recover').addClass("drawing-board-control-navigation-forward");
		 }
		 if (this.opts.reset){
			 this.$el.find('.clear').addClass("drawing-board-control-navigation-reset");
		 }
		 if (this.opts.save){
			 this.$el.find('.send').addClass("drawing-board-control-navigation-save");
		 }
		if (this.opts.back) {
			var $back = this.$el.find('.drawing-board-control-navigation-back');
			this.board.ev.bind('historyNavigation', $.proxy(function(pos) {
				if (pos === 1)
					$back.attr('disabled', 'disabled');
				else
					$back.removeAttr('disabled');
			}, this));
			this.$el.on('click', '.drawing-board-control-navigation-back', $.proxy(function(e) {
				this.board.goBackInHistory();
				e.preventDefault();
			}, this));
		}

		if (this.opts.forward) {
			var $forward = this.$el.find('.drawing-board-control-navigation-forward');
			this.board.ev.bind('historyNavigation', $.proxy(function(pos) {
				if (pos === this.board.history.values.length)
					$forward.attr('disabled', 'disabled');
				else
					$forward.removeAttr('disabled');
			}, this));
			this.$el.on('click', '.drawing-board-control-navigation-forward', $.proxy(function(e) {
				this.board.goForthInHistory();
				e.preventDefault();
			}, this));
		}

		if (this.opts.reset) {
			this.$el.on('click', '.drawing-board-control-navigation-reset', $.proxy(function(e) {
				this.board.reset({ background: true });
				e.preventDefault();
			}, this));
		}

		if (this.opts.save) {
			this.$el.on('click', '.drawing-board-control-navigation-save', $.proxy(function(e) {
				/*if(parent.uploadHTML5){
					parent.uploadHTML5(this.board.getImg());
				}*/
				e.preventDefault();
			}, this));
		}
	}
});